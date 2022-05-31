import 'package:aluno/app/domain/models/student_cart_model.dart';
import 'package:get/get.dart';

abstract class StudentCartUseCase {
  Future<void> list(RxList<StudentCartModel> list);
  Future<void> create(StudentCartModel studentCartModel);
  Future<void> update(StudentCartModel studentCartModel);
  Future<void> delete(String id);
  // Future<void> updateComponentsCompleted({
  //   required String studentCartId,
  //   required String componentId,
  //   required bool add,
  // });
}
