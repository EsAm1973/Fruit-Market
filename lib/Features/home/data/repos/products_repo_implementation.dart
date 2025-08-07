import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Core/services/database_service.dart';
import 'package:fruit_market/Features/home/data/models/product_model.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';
import 'package:fruit_market/Features/home/domain/repos/porducts_repo.dart';

class ProductsRepoImplementation implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      final rawList = await databaseService.getCollection(path: 'products');
      List<ProductModel> products =
          rawList.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> entities = products.map((e) => e.toEntity()).toList();
      return Right(entities);
    } on Exception {
      return Left(ServerFailure('Failed to get products'));
    }
  }
}
