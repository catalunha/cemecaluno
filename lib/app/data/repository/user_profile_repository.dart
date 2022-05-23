import 'package:aluno/app/domain/entity/user_profile_entity.dart';

abstract class UserProfileRepository {
  Future<void> create(UserProfileEntity userProfileEntity);
  Future<void> update(UserProfileEntity userProfileEntity);
}
