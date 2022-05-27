import 'package:aluno/app/data/datasource/entity/student_course_entity.dart';
import 'package:aluno/app/data/repository/student_course_repository.dart';
import 'package:aluno/app/domain/models/student_course_model.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class StudentCourseRepositoryB4a extends GetxService
    implements StudentCourseRepository {
  Future<QueryBuilder<ParseObject>> getQuery() async {
    QueryBuilder<ParseObject> studentCourseQuery =
        QueryBuilder<ParseObject>(ParseObject(StudentCourseEntity.className));
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    print('');
    studentCourseQuery.whereEqualTo('student', currentUser);
    // if (pagination != null) {
    //   queryProduct.setAmountToSkip((pagination.page - 1) * pagination.limit);
    //   queryProduct.setLimit(pagination.limit);
    // }
    // queryProduct.keysToReturn([
    //   'code',
    //   'name',
    //   'image',
    //   'description',
    //   'price',
    //   'isAvaliable',
    //   'menuIsOpen',
    // ]);
    // queryProduct.selectKeys('name', 'Ana');
    // queryCourse.orderByAscending('name');
    studentCourseQuery.includeObject(
        ['student', 'course', 'course.coordinator', 'course.organizer']);
    return studentCourseQuery;
  }

  @override
  Future<void> list(RxList<StudentCourseModel> list) async {
    final query = await getQuery();

    final ParseResponse studentCourseResponse = await query.query();
    if (studentCourseResponse.success &&
        studentCourseResponse.results != null) {
      list.clear();
      // print(apiResponse.results);
      // List<CourseModel> courseList = [];
      for (var element in studentCourseResponse.results!) {
        list.add(await StudentCourseEntity().fromParse(element as ParseObject));
      }
    } else {
      print('sem studentCourseResponse...');
    }
  }

  @override
  Future<void> create(StudentCourseModel studentCourseModel) async {
    // final studentCourseParseObject =
    //     await StudentCourseEntity().toParse(studentCourseModel);
    // await studentCourseParseObject.save();
    update(studentCourseModel);
  }

  @override
  Future<void> update(StudentCourseModel studentCourseModel) async {
    final studentCourseParseObject =
        await StudentCourseEntity().toParse(studentCourseModel);
    await studentCourseParseObject.save();
  }

  @override
  Future<void> delete(String id) async {
    var parseObject = ParseObject(StudentCourseEntity.className)..objectId = id;
    await parseObject.delete();
  }

  @override
  Future<void> updateComponentsCompleted(
      {required String studentCourseId,
      required String componentId,
      required bool add}) async {
    final studentCourseParseObject = ParseObject(StudentCourseEntity.className);
    studentCourseParseObject.objectId = studentCourseId;
    if (add) {
      studentCourseParseObject.setAddUnique('componentsCompleted', componentId);
    } else {
      studentCourseParseObject.setRemove('componentsCompleted', componentId);
    }

    await studentCourseParseObject.save();
  }
}
