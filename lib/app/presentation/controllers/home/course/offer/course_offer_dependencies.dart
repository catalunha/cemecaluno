import 'package:aluno/app/data/datasource/back4app/course/offer/course_offer_repository_b4a.dart';
import 'package:aluno/app/data/repository/course_offer_repository.dart';
import 'package:aluno/app/domain/usecases/course/offer/course_offer_usecase.dart';
import 'package:aluno/app/domain/usecases/course/offer/course_offer_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/home/course/offer/course_offer_controller.dart';
import 'package:get/get.dart';

class CourseOfferDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<CourseOfferRepository>(
      CourseOfferRepositoryB4a(),
    );
    Get.put<CourseOfferUseCase>(
      CourseOfferUseCaseImpl(
        courseOfferRepository: Get.find(),
      ),
    );
    Get.put<CourseOfferController>(
        CourseOfferController(courseOfferUseCase: Get.find()));
  }
}
