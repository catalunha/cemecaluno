import 'package:aluno/app/data/datasource/entity/course_offer_entity.dart';
import 'package:aluno/app/data/repository/course_offer_repository.dart';
import 'package:aluno/app/domain/models/course_offer_model.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CourseOfferRepositoryB4a extends GetxService
    implements CourseOfferRepository {
  Future<QueryBuilder<ParseObject>> getQuery() async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(CourseOfferEntity.className));
    // var currentUser = await ParseUser.currentUser() as ParseUser?;
    query.whereEqualTo('isOpen', true);
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
    query.orderByAscending('order');
    query.includeObject(['course']);
    return query;
  }

  @override
  Future<void> list(RxList<CourseOfferModel> list) async {
    final query = await getQuery();

    final ParseResponse courseResponse = await query.query();
    if (courseResponse.success && courseResponse.results != null) {
      list.clear();
      // print(apiResponse.results);
      // List<CourseModel> courseList = [];
      for (var element in courseResponse.results!) {
        print('resultsss');
        list.add(await CourseOfferEntity().fromParse(element as ParseObject));
      }
    } else {
      print('sem CourseOffer...');
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
