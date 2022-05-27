import 'package:aluno/app/data/datasource/entity/component_entity.dart';
import 'package:aluno/app/domain/models/component_model.dart';
import 'package:aluno/app/domain/models/course_model.dart';
import 'package:aluno/app/domain/models/user_profile_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:aluno/app/data/datasource/entity/user_profile_entity.dart';

class CourseEntity {
  Future<CourseModel> fromParse(ParseObject parseObject) async {
    //+++ get queryTeachers
    final List<UserProfileModel> teachers = [];
    QueryBuilder<ParseObject> queryTeachers =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryTeachers.whereRelatedTo('teachers', 'Course', parseObject.objectId!);
    final ParseResponse responseTeachers = await queryTeachers.query();
    if (responseTeachers.success && responseTeachers.results != null) {
      teachers.addAll(responseTeachers.results!
          .map<UserProfileModel>(
              (e) => UserProfileEntity().fromParse(e as ParseObject))
          .toList());
    }
    //--- get queryTeachers
    //+++ get queryComponents
    final List<ComponentModel> components = [];
    QueryBuilder<ParseObject> queryComponents =
        QueryBuilder<ParseObject>(ParseObject('Component'));
    queryComponents.whereRelatedTo(
        'components', 'Course', parseObject.objectId!);
    final ParseResponse responseComponents = await queryComponents.query();
    if (responseComponents.success && responseComponents.results != null) {
      for (var element in responseComponents.results!) {
        components
            .add(await ComponentEntity().fromParse(element as ParseObject));
      }
    }
    //--- get queryComponents
    print('CourseEntity');
    print(parseObject.objectId!);
    CourseModel courseModel = CourseModel(
      id: parseObject.objectId!,
      name: parseObject.get('name'),
      season: parseObject.get('season'),
      organizer: UserProfileEntity()
          .fromParse(parseObject.get('organizer') as ParseObject),
      program: parseObject.get('program'),
      community: parseObject.get('community'),
      image: parseObject.get('image')?.get('url'),
      description: parseObject.get('description'),
      coordinator: UserProfileEntity()
          .fromParse(parseObject.get('coordinator') as ParseObject),
      teachers: teachers,
      components: components,
      componentsOrder: List<String>.from(parseObject.get('componentsOrder')),
    );
    return courseModel;
  }
  // userProfileEntity.photoParseFileBase = kIsWeb
  //     ? parseObject.get('photo') as ParseWebFile
  //     : parseObject.get('photo') as ParseFile;

  Future<ParseObject> toParse(CourseModel courseModel) async {
    final course = ParseObject('Course');
    if (courseModel.id != null) course.objectId = courseModel.id;

    course.set('name', courseModel.name);
    course.set('season', courseModel.season);
    course.set('program', courseModel.program);
    course.set('organizer',
        (ParseObject('Profile')..objectId = courseModel.organizer.id));

    if (courseModel.teachers == null) {
      course.unset('teachers');
    } else {
      course.addRelation(
          'teachers',
          courseModel.teachers!
              .map((profile) => ParseObject('Profile')..objectId = profile.id)
              .toList());
    }
    if (courseModel.components == null) {
      course.unset('components');
    } else {
      course.addRelation(
          'components',
          courseModel.components!
              .map((component) =>
                  ParseObject('Component')..objectId = component.id)
              .toList());
    }
    if (courseModel.coordinator == null) {
      course.unset('coordinator');
    } else {
      course.set('coordinator',
          (ParseObject('Profile')..objectId = courseModel.coordinator!.id));
    }
    if (courseModel.community == null) {
      course.unset('community');
    } else {
      course.set('community', courseModel.community);
    }
    if (courseModel.description == null) {
      course.unset('description');
    } else {
      course.set('description', courseModel.description);
    }
    if (courseModel.componentsOrder == null) {
      course.unset('componentsOrder');
    } else {
      course.set('componentsOrder', courseModel.componentsOrder);
    }

    return course;
  }
}
