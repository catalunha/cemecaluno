import 'package:aluno/app/data/repository/student_course_repository.dart';
import 'package:aluno/app/domain/models/student_course_model.dart';
import 'package:aluno/app/domain/usecases/student/course/student_course_usecase.dart';
import 'package:get/get.dart';

class StudentCourseUseCaseImpl implements StudentCourseUseCase {
  final StudentCourseRepository _studentCourseRepository;
  StudentCourseUseCaseImpl({
    required StudentCourseRepository studentCourseRepository,
  }) : _studentCourseRepository = studentCourseRepository;
  @override
  Future<void> create(StudentCourseModel studentCourseModel) =>
      _studentCourseRepository.create(studentCourseModel);

  @override
  Future<void> delete(String id) => _studentCourseRepository.delete(id);

  @override
  Future<void> list(RxList<StudentCourseModel> list) =>
      _studentCourseRepository.list(list);

  // @override
  // Future<ProductModel?> readById(String id) {
  //   // TODO: implement readById
  //   throw UnimplementedError();
  // }

  @override
  Future<void> update(StudentCourseModel studentCourseModel) =>
      _studentCourseRepository.update(studentCourseModel);

  // @override
  // Future<void> updateAddress(String productId, String addressId) =>
  //     _studentCourseRepository.updateAddress(productId, addressId);

  // @override
  // void subscribe(
  //         {required RxList<ProductEntity> list, Pagination? pagination}) =>
  //     _studentCourseRepository.subscribe(list: list, pagination: pagination);
}
