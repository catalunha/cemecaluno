import 'package:aluno/app/data/datasource/entity/user_profile_entity.dart';
import 'package:aluno/app/domain/models/user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserEntity {
  UserModel fromParse(ParseUser parseUser) {
    return UserModel(
      id: parseUser.objectId!,
      email: parseUser.emailAddress!,
      phone: parseUser.username!,
      profile: parseUser.get('profile') != null
          ? UserProfileEntity().fromParse(parseUser.get('profile'))
          : null,
    );
  }
}
