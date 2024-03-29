import 'package:aluno/app/domain/models/course_model.dart';
import 'package:get/get.dart';

abstract class CourseRepository {
  Future<void> list(RxList<CourseModel> list);
  Future<void> create(CourseModel courseModel);
  Future<void> update(CourseModel courseModel);
  Future<void> delete(String id);
}
