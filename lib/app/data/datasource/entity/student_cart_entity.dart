import 'package:aluno/app/data/datasource/entity/course_payment_entity.dart';
import 'package:aluno/app/data/datasource/entity/user_entity.dart';
import 'package:aluno/app/domain/models/student_cart_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class StudentCartEntity {
  static const String className = 'StudentCart';
  Future<StudentCartModel> fromParse(ParseObject parseObject) async {
    StudentCartModel courseOfferModel = StudentCartModel(
      id: parseObject.objectId!,
      student: UserEntity().fromParse(parseObject.get('student') as ParseUser),
      coursePayment: await CoursePaymentEntity()
          .fromParse(parseObject.get('coursePayment') as ParseObject),
      generatedCob: parseObject.get('generatedCob'),
    );
    return courseOfferModel;
  }

  Future<ParseObject> toParse(StudentCartModel model) async {
    final parse = ParseObject(StudentCartEntity.className);
    print('toParse');
    if (model.id != null) {
      parse.objectId = model.id;
    }
    print(parse);
    parse.set('student', (await ParseUser.currentUser()));
    print(parse);
    parse.set(
        'coursePayment',
        (ParseObject(CoursePaymentEntity.className)
          ..objectId = model.coursePayment.id));
    parse.set('generatedCob', model.generatedCob);
    print(parse);
    return parse;
  }
}
