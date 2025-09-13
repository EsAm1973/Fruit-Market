import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_input_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, void>> addOrder(OrderInputEntity order);
}
