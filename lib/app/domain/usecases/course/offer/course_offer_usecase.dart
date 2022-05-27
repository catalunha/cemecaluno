import 'package:aluno/app/domain/models/course_offer_model.dart';
import 'package:get/get.dart';

abstract class CourseOfferUseCase {
  Future<void> list(RxList<CourseOfferModel> list);
  // Future<void> create(CourseModel courseModel);
  // Future<void> update(CourseModel courseModel);
  // Future<void> delete(String id);
}
