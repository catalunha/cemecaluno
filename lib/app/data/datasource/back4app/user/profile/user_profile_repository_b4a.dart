import 'package:aluno/app/data/repository/user_profile_repository.dart';
import 'package:aluno/app/domain/entity/user_profile_entity.dart';

class UserProfileRepositoryB4a implements UserProfileRepository {
  @override
  Future<void> create(UserProfileEntity userProfileEntity) async {
    print('userProfile Repo create');
    print(userProfileEntity);

    final userProfileParse = await userProfileEntity.toParse();
    print(userProfileParse);
    await userProfileParse.save();
  }

  @override
  Future<void> update(UserProfileEntity userProfileEntity) async {
    print('userProfile Repo update');
    print(userProfileEntity);
    final userProfileParse = await userProfileEntity.toParse();
    await userProfileParse.save();
  }
}
