import 'package:aluno/app/data/datasource/entity/student_cart_entity.dart';
import 'package:aluno/app/data/repository/student_cart_repository.dart';
import 'package:aluno/app/domain/models/student_cart_model.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class StudentCartRepositoryB4a extends GetxService
    implements StudentCartRepository {
  Future<QueryBuilder<ParseObject>> getQuery() async {
    QueryBuilder<ParseObject> studentCartQuery =
        QueryBuilder<ParseObject>(ParseObject(StudentCartEntity.className));
    var currentUser = await ParseUser.currentUser() as ParseUser?;
    print('');
    studentCartQuery.whereEqualTo('student', currentUser);
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
    // queryCart.orderByAscending('name');
    studentCartQuery.includeObject([
      'student',
      'coursePayment',
      'coursePayment.course',
      'coursePayment.course.organizer',
      'coursePayment.course.coordinator'
    ]);
    return studentCartQuery;
  }

  @override
  Future<void> list(RxList<StudentCartModel> list) async {
    final query = await getQuery();

    final ParseResponse studentCartResponse = await query.query();
    if (studentCartResponse.success && studentCartResponse.results != null) {
      list.clear();
      // print(apiResponse.results);
      // List<CartModel> courseList = [];
      for (var element in studentCartResponse.results!) {
        list.add(await StudentCartEntity().fromParse(element as ParseObject));
      }
    } else {
      print('sem studentCartResponse...');
    }
  }

  @override
  Future<void> create(StudentCartModel studentCartModel) async {
    // final studentCartParseObject =
    //     await StudentCartEntity().toParse(studentCartModel);
    // await studentCartParseObject.save();
    await update(studentCartModel);
  }

  @override
  Future<void> update(StudentCartModel studentCartModel) async {
    final studentCartParseObject =
        await StudentCartEntity().toParse(studentCartModel);
    print('===> update');
    print(studentCartModel);
    print(studentCartParseObject);
    await studentCartParseObject.save();
  }

  @override
  Future<void> delete(String id) async {
    var parseObject = ParseObject(StudentCartEntity.className)..objectId = id;
    await parseObject.delete();
  }

  // @override
  // Future<void> updateComponentsCompleted(
  //     {required String studentCartId,
  //     required String componentId,
  //     required bool add}) async {
  //   final studentCartParseObject = ParseObject(StudentCartEntity.className);
  //   studentCartParseObject.objectId = studentCartId;
  //   if (add) {
  //     studentCartParseObject.setAddUnique('componentsCompleted', componentId);
  //   } else {
  //     studentCartParseObject.setRemove('componentsCompleted', componentId);
  //   }

  //   await studentCartParseObject.save();
  // }
}
