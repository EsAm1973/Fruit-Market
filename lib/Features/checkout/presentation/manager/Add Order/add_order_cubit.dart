import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_input_entity.dart';
import 'package:fruit_market/Features/checkout/domain/repos/orders_repo.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepo ordersRepo;
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());

  Future<void> addOrder(OrderInputEntity order) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(order);
    result.fold(
      (l) => emit(AddOrderError(l.message)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
