import 'package:aluno/app/data/datasource/entity/course_payment_entity.dart';
import 'package:aluno/app/data/repository/course_payment_repository.dart';
import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CoursePaymentRepositoryB4a extends GetxService
    implements CoursePaymentRepository {
  Future<QueryBuilder<ParseObject>> getQuery(
      {required String courseId, required String paymentType}) async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(CoursePaymentEntity.className));
    // var currentUser = await ParseUser.currentUser() as ParseUser?;
    query.whereEqualTo('course', ParseObject('Course')..objectId = courseId);
    query.whereEqualTo('paymentType', paymentType);
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
    query.orderByAscending('paymentMode');
    query.orderByAscending('installment');
    query.includeObject(['course', 'course.coordinator', 'course.organizer']);
    return query;
  }

  @override
  Future<void> list(
      {required RxList<CoursePaymentModel> list,
      required String courseId,
      required String paymentType}) async {
    final query = await getQuery(courseId: courseId, paymentType: paymentType);

    final ParseResponse courseResponse = await query.query();
    if (courseResponse.success && courseResponse.results != null) {
      list.clear();
      // print(apiResponse.results);
      // List<CourseModel> courseList = [];
      for (var element in courseResponse.results!) {
        print('resultsss');
        list.add(await CoursePaymentEntity().fromParse(element as ParseObject));
      }
    } else {
      print('sem CoursePayment...');
    }
  }

  // @override
  // Future<void> create(CourseModel courseModel) async {
  //   final courseParseObject = await CourseEntity().toParse(courseModel);
  //   await courseParseObject.save();
  // }

  // @override
  // Future<void> update(CourseModel courseModel) async {
  //   final courseParseObject = await CourseEntity().toParse(courseModel);
  //   await courseParseObject.save();
  // }

  // @override
  // Future<void> delete(String id) async {
  //   var parseObject = ParseObject('Course')..objectId = id;
  //   await parseObject.delete();
  // }
}
