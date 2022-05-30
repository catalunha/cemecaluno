import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:get/get.dart';

abstract class CoursePaymentUseCase {
  Future<void> list(
      {required RxList<CoursePaymentModel> list,
      required String courseId,
      required String paymentType});
  // Future<void> create(CourseModel courseModel);
  // Future<void> update(CourseModel courseModel);
  // Future<void> delete(String id);
}
