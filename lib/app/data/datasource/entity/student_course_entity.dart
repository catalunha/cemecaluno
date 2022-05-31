import 'package:aluno/app/data/datasource/entity/course_entity.dart';
import 'package:aluno/app/data/datasource/entity/user_entity.dart';
import 'package:aluno/app/domain/models/student_course_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class StudentCourseEntity {
  static const String className = 'StudentCourse';
  Future<StudentCourseModel> fromParse(ParseObject parseObject) async {
    return StudentCourseModel(
      id: parseObject.objectId!,
      user: UserEntity().fromParse(parseObject.get('student') as ParseUser),
      course: await CourseEntity()
          .fromParse(parseObject.get('course') as ParseObject),
      componentsIfPaid: parseObject.get('componentsIfPaid') == null
          ? null
          : List<String>.from(parseObject.get('componentsIfPaid')),
      componentsCompleted: parseObject.get('componentsCompleted') == null
          ? null
          : List<String>.from(parseObject.get('componentsCompleted')),
    );
  }

  Future<ParseObject> toParse(StudentCourseModel studentCourseModel) async {
    final studentCourseParseObject = ParseObject(StudentCourseEntity.className);
    if (studentCourseModel.id != null) {
      studentCourseParseObject.objectId = studentCourseModel.id;
    }
    studentCourseParseObject.set('student', (await ParseUser.currentUser()));
    studentCourseParseObject.set('course',
        (ParseObject('course')..objectId = studentCourseModel.course.id));
    if (studentCourseModel.componentsIfPaid == null) {
      studentCourseParseObject.unset('componentsIfPaid');
    } else {
      studentCourseParseObject.set(
          'componentsIfPaid', studentCourseModel.componentsIfPaid);
    }
    if (studentCourseModel.componentsCompleted == null) {
      studentCourseParseObject.unset('componentsCompleted');
    } else {
      studentCourseParseObject.set(
          'componentsCompleted', studentCourseModel.componentsCompleted);
    }
    return studentCourseParseObject;
  }
}
