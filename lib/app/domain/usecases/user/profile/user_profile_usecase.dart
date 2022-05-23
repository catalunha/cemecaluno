import 'package:aluno/app/domain/entity/user_profile_entity.dart';

abstract class UserProfileUseCase {
  Future<void> create(UserProfileEntity userProfileEntity);
  Future<void> update(UserProfileEntity userProfileEntity);
}
