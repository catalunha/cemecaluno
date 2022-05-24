import 'package:aluno/app/data/datasource/back4app/user/profile/user_profile_repository_exception.dart';
import 'package:aluno/app/domain/entity/user_profile_entity.dart';
import 'package:aluno/app/domain/usecases/user/profile/user_profile_usecase.dart';
import 'package:aluno/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/loader_mixin.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/message_mixin.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserProfileController extends GetxController
    with LoaderMixin, MessageMixin {
  final UserProfileUseCase _userProfileUseCase;
  UserProfileController({required UserProfileUseCase userProfileUseCase})
      : _userProfileUseCase = userProfileUseCase;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _userProfile = Rxn<UserProfileEntity>();
  UserProfileEntity? get userProfile => _userProfile.value;

  XFile? _xfile;
  set xfile(XFile? xfile) {
    _xfile = xfile;
  }

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    UserProfileEntity? model = Get.arguments;
    // print('Get.arguments = ${Get.arguments}');
    _userProfile(model);
    super.onInit();
  }

  Future<void> append({
    String? fullName,
    String? nameTag,
    String? description,
    bool? isWoman,
    String? discord,
    String? telegram,
  }) async {
    try {
      _loading(true);

      if (_userProfile.value == null) {
        print('profile create');
        var userProfile = UserProfileEntity(
          id: null,
          fullName: fullName,
          nameTag: nameTag,
          description: description,
          isWoman: isWoman,
          discord: discord,
          telegram: telegram,
        );
        if (_xfile != null) {
          ParseFileBase xFile2ParseFile =
              await UserProfileEntity.xFile2ParseFile(_xfile!);
          userProfile.photoParseFileBase = xFile2ParseFile;
        }
        print(userProfile);
        await _userProfileUseCase.create(userProfile);
      } else {
        var userProfile = _userProfile.value!.copyWith(
          fullName: fullName,
          nameTag: nameTag,
          description: description,
          isWoman: isWoman,
          discord: discord,
          telegram: telegram,
        );
        if (_xfile != null) {
          ParseFileBase xFile2ParseFile =
              await UserProfileEntity.xFile2ParseFile(_xfile!);
          userProfile.photoParseFileBase = xFile2ParseFile;
        }
        await _userProfileUseCase.update(userProfile);
      }
      SplashController splashController = Get.find();
      await splashController.updateUserProfile();
    } on UserProfileRepositoryException {
      _message.value = MessageModel(
        title: 'Erro em UserProfileController',
        message: 'Não foi possivel salvar o perfil',
        isError: true,
      );
    } finally {
      _loading(false);
    }
  }
}
