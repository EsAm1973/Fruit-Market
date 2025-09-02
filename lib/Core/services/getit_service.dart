import 'package:fruit_market/Core/services/database_service.dart';
import 'package:fruit_market/Core/services/firebase_auth_services.dart';
import 'package:fruit_market/Core/services/firestore_service.dart';
import 'package:fruit_market/Features/auth/data/repos/auth_repo_implementation.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit_market/Features/checkout/data/repos/orders_repo_impl.dart';
import 'package:fruit_market/Features/checkout/domain/repos/orders_repo.dart';
import 'package:fruit_market/Features/home/data/repos/products_repo_implementation.dart';
import 'package:fruit_market/Features/home/domain/repos/porducts_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      databaseService: getIt<DatabaseService>(),
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImplementation(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(firestoreService: getIt<DatabaseService>()),
  );
}
