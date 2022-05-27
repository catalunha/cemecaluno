import 'package:aluno/app/data/datasource/entity/course_entity.dart';
import 'package:aluno/app/domain/models/course_offer_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CourseOfferEntity {
  static const String className = 'CourseOffer';
  Future<CourseOfferModel> fromParse(ParseObject parseObject) async {
    CourseOfferModel courseOfferModel = CourseOfferModel(
      id: parseObject.objectId!,
      course: await CourseEntity()
          .fromParse(parseObject.get('course') as ParseObject),
      msgCost: parseObject.get('msgCost'),
      msgOpenUntil: parseObject.get('msgOpenUntil'),
      vacancies: parseObject.get('vacancies'),
      payWith: List<String>.from(parseObject.get('payWith')),
      order: parseObject.get('order'),
    );
    return courseOfferModel;
  }

  Future<ParseObject> toParse(CourseOfferModel courseOfferModel) async {
    final courseOfferParserObject = ParseObject(CourseOfferEntity.className);
    if (courseOfferModel.id != null) {
      courseOfferParserObject.objectId = courseOfferModel.id;
    }
    courseOfferParserObject.set('course',
        (ParseObject('Course')..objectId = courseOfferModel.course.id));
    courseOfferParserObject.set('order', courseOfferModel.order);
    if (courseOfferModel.msgCost == null) {
      courseOfferParserObject.unset('msgCost');
    } else {
      courseOfferParserObject.set('msgCost', courseOfferModel.msgCost);
    }
    if (courseOfferModel.msgOpenUntil == null) {
      courseOfferParserObject.unset('msgOpenUntil');
    } else {
      courseOfferParserObject.set(
          'msgOpenUntil', courseOfferModel.msgOpenUntil);
    }
    if (courseOfferModel.vacancies == null) {
      courseOfferParserObject.unset('vacancies');
    } else {
      courseOfferParserObject.set('vacancies', courseOfferModel.vacancies);
    }
    if (courseOfferModel.payWith == null) {
      courseOfferParserObject.unset('payWith');
    } else {
      courseOfferParserObject.set('payWith', courseOfferModel.payWith);
    }
    return courseOfferParserObject;
  }
}
