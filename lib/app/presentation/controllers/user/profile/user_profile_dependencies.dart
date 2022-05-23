import 'package:aluno/app/data/datasource/back4app/user/profile/user_profile_repository_b4a.dart';
import 'package:aluno/app/data/repository/user_profile_repository.dart';
import 'package:aluno/app/domain/usecases/user/profile/user_profile_usecase.dart';
import 'package:aluno/app/domain/usecases/user/profile/user_profile_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/user/profile/user_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<UserProfileRepository>(
      UserProfileRepositoryB4a(),
    );
    Get.put<UserProfileUseCase>(
      UserProfileUseCaseImpl(userProfileRepository: Get.find()),
    );
    Get.lazyPut<UserProfileController>(
      () => UserProfileController(
        userProfileUseCase: Get.find(),
      ),
    );
  }
}
