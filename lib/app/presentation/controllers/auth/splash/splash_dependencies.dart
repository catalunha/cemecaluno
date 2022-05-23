import 'package:aluno/app/data/datasource/back4app/auth/auth_repository_b4a.dart';
import 'package:aluno/app/data/repository/auth_repository.dart';
import 'package:aluno/app/domain/usecases/auth/auth_usecase.dart';
import 'package:aluno/app/domain/usecases/auth/auth_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(
      AuthRepositoryB4a(),
      // permanent: true,
    );
    Get.put<AuthUseCase>(
      AuthUseCaseImpl(
        authRepository: Get.find(),
      ),
      // permanent: true,
    );
    Get.put<SplashController>(
      SplashController(
        authUseCase: Get.find(),
      ),
      permanent: true,
    );
  }
}
