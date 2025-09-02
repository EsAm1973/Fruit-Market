import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_market/Core/helper_functions/build_error_bar.dart';
import 'package:fruit_market/Core/utils/app_keys.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_market/Features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_market/Features/checkout/presentation/manager/Add%20Order/add_order_cubit.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_steps_pageview.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    valueNotifier.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          buildErrorBar(context, 'تم اضافة الطلب بنجاح');
        } else if (state is AddOrderError) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CheckoutSteps(
              currentPageIndex: currentPageIndex,
              pageController: pageController,
            ),
            Expanded(
              child: CheckOutStepsPageView(
                pageController: pageController,
                formKey: formKey,
                valueListenable: valueNotifier,
              ),
            ),
            BlocBuilder<AddOrderCubit, AddOrderState>(
              builder: (context, state) {
                if (state is AddOrderLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButtom(
                  onpressed: () {
                    if (currentPageIndex == 0) {
                      handleShippingSectionValidation(context);
                    } else if (currentPageIndex == 1) {
                      handleAddressValidation(context);
                    } else {
                      processPayment(context);
                    }
                  },
                  text: currentPageIndex == 2 ? 'الدفع عبر PayPal' : 'التالي',
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('يرجي تحديد طريقه الدفع')));
    }
  }

  void handleAddressValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void processPayment(BuildContext context) {
    var order = context.read<OrderEntity>();
    var paypalPaymentEntity = PaypalPaymentEntity.fromEntity(order);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: kPaypalClientID,
              secretKey: kPaypalSecretKey,
              transactions: [paypalPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
                GoRouter.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تمت الدفع بنجاح')),
                );
              },
              onError: (error) {
                print("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
              },
            ),
      ),
    );
  }
}
