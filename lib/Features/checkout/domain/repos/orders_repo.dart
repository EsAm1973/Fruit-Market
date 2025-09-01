import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, void>> addOrder(OrderEntity order);
}