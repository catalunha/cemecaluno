import 'package:aluno/app/data/datasource/back4app/student/course/student_course_repository_b4a.dart';
import 'package:aluno/app/data/repository/student_course_repository.dart';
import 'package:aluno/app/domain/usecases/student/course/student_course_usecase.dart';
import 'package:aluno/app/domain/usecases/student/course/student_course_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/student/course/student_course_controller.dart';
import 'package:get/get.dart';

class StudentCourseDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<StudentCourseRepository>(
      StudentCourseRepositoryB4a(),
    );
    Get.put<StudentCourseUseCase>(
      StudentCourseUseCaseImpl(
        studentCourseRepository: Get.find(),
      ),
    );
    Get.put<StudentCourseController>(
        StudentCourseController(studentCourseUseCase: Get.find()));
  }
}
