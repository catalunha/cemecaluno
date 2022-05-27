import 'package:aluno/app/domain/models/user_profile_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserProfileEntity {
  static const String className = 'Profile';

  UserProfileModel fromParse(ParseObject parseObject) {
    UserProfileModel userProfileEntity = UserProfileModel(
      id: parseObject.objectId!,
      fullName: parseObject.get('fullName'),
      nameTag: parseObject.get('nameTag'),
      description: parseObject.get('description'),
      isWoman: parseObject.get('isWoman'),
      photo: parseObject.get('photo')?.get('url'),

      // photo: parseObject.get('photo') != null
      //     ? parseObject.get('photo')?.get('url')
      //     : null,
      discord: parseObject.get('discord'),
      telegram: parseObject.get('telegram'),
    );
    // userProfileEntity.photoParseFileBase = kIsWeb
    //     ? parseObject.get('photo') as ParseWebFile
    //     : parseObject.get('photo') as ParseFile;
    return userProfileEntity;
  }

  Future<ParseObject> toParse(UserProfileModel userProfileModel) async {
    final profileParse = ParseObject(UserProfileEntity.className);
    if (userProfileModel.id != null) {
      profileParse.objectId = userProfileModel.id;
    }
    if (userProfileModel.fullName != null) {
      profileParse.set('fullName', userProfileModel.fullName);
    }

    // if (fullName == null) {
    //   profileParse.unset('fullName');
    // } else {
    //   profileParse.set('fullName', fullName);
    // }
    if (userProfileModel.nameTag != null) {
      profileParse.set('nameTag', userProfileModel.nameTag);
    }
    if (userProfileModel.description != null) {
      profileParse.set('description', userProfileModel.description);
    }
    if (userProfileModel.isWoman != null) {
      profileParse.set('isWoman', userProfileModel.isWoman);
    }
    // if (userProfileModel.photoParseFileBase != null) {
    //   profileParse.set('photo', userProfileModel.photoParseFileBase);
    // }
    if (userProfileModel.discord != null) {
      profileParse.set('discord', userProfileModel.discord);
    }
    if (userProfileModel.telegram != null) {
      profileParse.set('telegram', userProfileModel.telegram);
    }
    return profileParse;
  }
}
