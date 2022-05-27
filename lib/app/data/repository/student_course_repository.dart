import 'package:aluno/app/domain/models/student_course_model.dart';
import 'package:get/get.dart';

abstract class StudentCourseRepository {
  Future<void> list(RxList<StudentCourseModel> list);
  Future<void> create(StudentCourseModel studentCourseModel);
  Future<void> update(StudentCourseModel studentCourseModel);
  Future<void> delete(String id);
  Future<void> updateComponentsCompleted({
    required String studentCourseId,
    required String componentId,
    required bool add,
  });
}
