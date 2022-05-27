import 'package:aluno/app/domain/models/component_model.dart';
import 'package:aluno/app/domain/models/user_profile_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:aluno/app/data/datasource/entity/user_profile_entity.dart';

class ComponentEntity {
  static const String className = 'Component';

  Future<ComponentModel> fromParse(ParseObject parseObject) async {
    //+++ get allTeachers
    final List<UserProfileModel> teachers = [];
    QueryBuilder<ParseObject> queryTeachers =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryTeachers.whereRelatedTo(
        'teachers', 'Component', parseObject.objectId!);
    final ParseResponse responseTeachers = await queryTeachers.query();
    if (responseTeachers.success && responseTeachers.results != null) {
      teachers.addAll(responseTeachers.results!
          .map<UserProfileModel>(
              (e) => UserProfileEntity().fromParse(e as ParseObject))
          .toList());
    }
    //--- get allTeachers

    ComponentModel componentModel = ComponentModel(
      id: parseObject.objectId!,
      module: parseObject.get('module'),
      name: parseObject.get('name'),
      folder: parseObject.get('folder'),
      video: parseObject.get('video'),
      teachers: teachers,
      image: parseObject.get('image')?.get('url'),
      description: parseObject.get('description'),
      pluscode: parseObject.get('pluscode'),
    );
    return componentModel;
  }
  // userProfileEntity.photoParseFileBase = kIsWeb
  //     ? parseObject.get('photo') as ParseWebFile
  //     : parseObject.get('photo') as ParseFile;

  Future<ParseObject> toParse(ComponentModel componentModel) async {
    final component = ParseObject(ComponentEntity.className);
    if (componentModel.id != null) component.objectId = componentModel.id;

    component.set('module', componentModel.module);
    component.set('name', componentModel.name);
    component.set('folder', componentModel.folder);
    component.set('video', componentModel.video);
    component.addRelation(
        'teachers',
        componentModel.teachers
            .map((profile) => ParseObject('Profile')..objectId = profile.id)
            .toList());
    if (componentModel.description == null) {
      component.unset('description');
    } else {
      component.set('description', componentModel.description);
    }
    if (componentModel.pluscode == null) {
      component.unset('pluscode');
    } else {
      component.set('pluscode', componentModel.pluscode);
    }

    return component;
  }
}
