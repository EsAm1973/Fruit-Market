import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Core/services/database_service.dart';
import 'package:fruit_market/Features/checkout/data/models/order_model.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_market/Features/checkout/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService firestoreService;

  OrdersRepoImpl({required this.firestoreService});
  @override
  Future<Either<Failures, void>> addOrder(OrderEntity order) async {
    try {
      await firestoreService.addData(
        path: 'orders',
        data: OrderModel.fromEntity(order).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
