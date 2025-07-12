import 'package:fruit_market/Core/services/firebase_auth_services.dart';
import 'package:fruit_market/Features/auth/data/repos/auth_repo_implementation.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
