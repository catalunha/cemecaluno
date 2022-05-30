import 'package:aluno/app/data/datasource/back4app/course/payment/course_payment_repository_b4a.dart';
import 'package:aluno/app/data/repository/course_payment_repository.dart';
import 'package:aluno/app/domain/usecases/course/payment/course_payment_usecase.dart';
import 'package:aluno/app/domain/usecases/course/payment/course_payment_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/course/payment/course_payment_controller.dart';
import 'package:get/get.dart';

class CoursePaymentDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<CoursePaymentRepository>(
      CoursePaymentRepositoryB4a(),
    );
    Get.put<CoursePaymentUseCase>(
      CoursePaymentUseCaseImpl(
        coursePaymentRepository: Get.find(),
      ),
    );
    Get.put<CoursePaymentController>(
        CoursePaymentController(coursePaymentUseCase: Get.find()));
  }
}
