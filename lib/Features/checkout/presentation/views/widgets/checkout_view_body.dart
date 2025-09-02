import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_market/Core/helper_functions/build_error_bar.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_market/Features/checkout/presentation/manager/Add%20Order/add_order_cubit.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_steps_pageview.dart';
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: "",
              secretKey: "",
              transactions: const [
                {
                  "amount": {
                    "total": '70',
                    "currency": "USD",
                    "details": {
                      "subtotal": '70',
                      "shipping": '0',
                      "shipping_discount": 0,
                    },
                  },
                  "description": "The payment transaction description.",
                  // "payment_options": {
                  //   "allowed_payment_method":
                  //       "INSTANT_FUNDING_SOURCE"
                  // },
                  "item_list": {
                    "items": [
                      {
                        "name": "Apple",
                        "quantity": 4,
                        "price": '5',
                        "currency": "USD",
                      },
                      {
                        "name": "Pineapple",
                        "quantity": 5,
                        "price": '10',
                        "currency": "USD",
                      },
                    ],

                    // shipping address is not required though
                    //   "shipping_address": {
                    //     "recipient_name": "tharwat",
                    //     "line1": "Alexandria",
                    //     "line2": "",
                    //     "city": "Alexandria",
                    //     "country_code": "EG",
                    //     "postal_code": "21505",
                    //     "phone": "+00000000",
                    //     "state": "Alexandria"
                    //  },
                  },
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                print("onSuccess: $params");
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
