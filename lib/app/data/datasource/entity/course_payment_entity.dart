import 'package:aluno/app/data/datasource/entity/course_entity.dart';
import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CoursePaymentEntity {
  static const String className = 'CoursePayment';
  Future<CoursePaymentModel> fromParse(ParseObject parseObject) async {
    CoursePaymentModel courseOfferModel = CoursePaymentModel(
      id: parseObject.objectId!,
      course: await CourseEntity()
          .fromParse(parseObject.get('course') as ParseObject),
      cost: parseObject.get('cost'),
      paymentType: parseObject.get('paymentType'),
      paymentMode: parseObject.get('paymentMode'),
      paymentDescription: parseObject.get('paymentDescription'),
      installment: parseObject.get('installment'),
      installments: parseObject.get('installments'),
      payDate: DateTime.parse(parseObject.get('payDate').toString()),
      feePerDay: parseObject.get('feePerDay'),
      componentIfPaid: List<String>.from(parseObject.get('componentIfPaid')),
    );
    return courseOfferModel;
  }

  Future<ParseObject> toParse(CoursePaymentModel model) async {
    final parse = ParseObject(CoursePaymentEntity.className);
    if (model.id != null) {
      parse.objectId = model.id;
    }
    parse.set('course', (ParseObject('Course')..objectId = model.course.id));
    parse.set('cost', model.cost);
    parse.set('paymentType', model.paymentType);
    parse.set('paymentMode', model.paymentMode);
    parse.set('paymentDescription', model.paymentDescription);
    parse.set('installment', model.installment);
    parse.set('installments', model.installments);
    parse.set('payDate', model.payDate);
    if (model.feePerDay == null) {
      parse.unset('feePerDay');
    } else {
      parse.set('feePerDay', model.feePerDay);
    }
    if (model.componentIfPaid == null) {
      parse.unset('componentIfPaid');
    } else {
      parse.set('componentIfPaid', model.componentIfPaid);
    }
    return parse;
  }
}
