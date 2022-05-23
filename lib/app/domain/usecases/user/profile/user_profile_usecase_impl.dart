import 'package:aluno/app/data/repository/user_profile_repository.dart';
import 'package:aluno/app/domain/entity/user_profile_entity.dart';
import 'package:aluno/app/domain/usecases/user/profile/user_profile_usecase.dart';

class UserProfileUseCaseImpl implements UserProfileUseCase {
  final UserProfileRepository _userProfileRepository;
  UserProfileUseCaseImpl({required UserProfileRepository userProfileRepository})
      : _userProfileRepository = userProfileRepository;

  @override
  Future<void> create(UserProfileEntity userProfileEntity) async {
    print(userProfileEntity);
    return await _userProfileRepository.create(userProfileEntity);
  }

  @override
  Future<void> update(UserProfileEntity userProfileEntity) async {
    print(userProfileEntity);
    await _userProfileRepository.update(userProfileEntity);
  }
}
