import 'package:aluno/app/data/datasource/entity/course_entity.dart';
import 'package:aluno/app/data/repository/course_repository.dart';
import 'package:aluno/app/domain/models/course_model.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CourseRepositoryB4a extends GetxService implements CourseRepository {
  Future<QueryBuilder<ParseObject>> getQuery() async {
    QueryBuilder<ParseObject> queryCourse =
        QueryBuilder<ParseObject>(ParseObject('Course'));
    // var currentUser = await ParseUser.currentUser() as ParseUser?;
    // queryProduct.whereEqualTo('isAvaliable', true);
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
    queryCourse.includeObject(['organizer', 'coordinator']);
    return queryCourse;
  }

  @override
  Future<void> list(RxList<CourseModel> list) async {
    final query = await getQuery();

    final ParseResponse courseResponse = await query.query();
    if (courseResponse.success && courseResponse.results != null) {
      list.clear();
      // print(apiResponse.results);
      // List<CourseModel> courseList = [];
      for (var element in courseResponse.results!) {
        list.add(await CourseEntity().fromParse(element as ParseObject));
      }
    } else {
      print('sem produtos...');
    }
  }

  @override
  Future<void> create(CourseModel courseModel) async {
    final courseParseObject = await CourseEntity().toParse(courseModel);
    await courseParseObject.save();
  }

  @override
  Future<void> update(CourseModel courseModel) async {
    final courseParseObject = await CourseEntity().toParse(courseModel);
    await courseParseObject.save();
  }

  @override
  Future<void> delete(String id) async {
    var parseObject = ParseObject('Course')..objectId = id;
    await parseObject.delete();
  }
}
