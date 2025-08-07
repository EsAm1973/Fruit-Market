import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductEntity>>> getProducts();
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}
