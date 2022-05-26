import 'package:aluno/app/data/repository/course_repository.dart';
import 'package:aluno/app/domain/models/course_model.dart';
import 'package:aluno/app/domain/usecases/course/course_usecase.dart';
import 'package:get/get.dart';

class CourseUseCaseImpl implements CourseUseCase {
  final CourseRepository _courseRepository;
  CourseUseCaseImpl({
    required CourseRepository courseRepository,
  }) : _courseRepository = courseRepository;
  @override
  Future<void> create(CourseModel courseModel) =>
      _courseRepository.create(courseModel);

  @override
  Future<void> delete(String id) => _courseRepository.delete(id);

  @override
  Future<void> list(RxList<CourseModel> list) => _courseRepository.list(list);

  // @override
  // Future<ProductModel?> readById(String id) {
  //   // TODO: implement readById
  //   throw UnimplementedError();
  // }

  @override
  Future<void> update(CourseModel courseModel) =>
      _courseRepository.update(courseModel);

  // @override
  // Future<void> updateAddress(String productId, String addressId) =>
  //     _courseRepository.updateAddress(productId, addressId);

  // @override
  // void subscribe(
  //         {required RxList<ProductEntity> list, Pagination? pagination}) =>
  //     _courseRepository.subscribe(list: list, pagination: pagination);
}
