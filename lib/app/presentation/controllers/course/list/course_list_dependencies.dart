import 'package:aluno/app/data/datasource/back4app/course/course_repository_b4a.dart';
import 'package:aluno/app/data/repository/course_repository.dart';
import 'package:aluno/app/domain/usecases/course/course_usecase.dart';
import 'package:aluno/app/domain/usecases/course/course_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/course/list/course_list_controller.dart';
import 'package:get/get.dart';

class CourseListDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<CourseRepository>(
      CourseRepositoryB4a(),
    );
    Get.put<CourseUseCase>(
      CourseUseCaseImpl(
        courseRepository: Get.find(),
      ),
    );
    Get.put<CourseListController>(
        CourseListController(courseUseCase: Get.find()));
  }
}
