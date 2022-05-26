import 'package:aluno/app/domain/models/course_model.dart';
import 'package:get/get.dart';

abstract class CourseUseCase {
  Future<void> create(CourseModel courseModel);
  Future<void> update(CourseModel courseModel);
  Future<void> delete(String id);
  Future<void> list(RxList<CourseModel> list);
}
