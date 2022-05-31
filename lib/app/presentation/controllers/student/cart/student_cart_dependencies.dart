import 'package:aluno/app/data/datasource/back4app/student/cart/student_cart_repository_b4a.dart';
import 'package:aluno/app/data/repository/student_cart_repository.dart';
import 'package:aluno/app/domain/usecases/student/cart/student_cart_usecase.dart';
import 'package:aluno/app/domain/usecases/student/cart/student_cart_usecase_impl.dart';
import 'package:aluno/app/presentation/controllers/student/cart/student_cart_controller.dart';
import 'package:get/get.dart';

class StudentCartDependencies implements Bindings {
  @override
  void dependencies() {
    Get.put<StudentCartRepository>(
      StudentCartRepositoryB4a(),
    );
    Get.put<StudentCartUseCase>(
      StudentCartUseCaseImpl(
        studentCartRepository: Get.find(),
      ),
    );
    Get.put<StudentCartController>(
        StudentCartController(studentCartUseCase: Get.find()));
  }
}
