import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_market/Core/errors/failures.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';
import 'package:fruit_market/Features/home/domain/repos/porducts_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    Either<Failures, List<ProductEntity>> response =
        await productsRepo.getProducts();
    response.fold(
      (l) => emit(ProductsError(l.message)),
      (r) => emit(ProductsLoaded(r)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    Either<Failures, List<ProductEntity>> response =
        await productsRepo.getBestSellingProducts();
    response.fold(
      (l) => emit(ProductsError(l.message)),
      (r) => emit(ProductsLoaded(r)),
    );
  }
}
