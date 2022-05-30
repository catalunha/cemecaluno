import 'package:aluno/app/data/repository/course_payment_repository.dart';
import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:aluno/app/domain/usecases/course/payment/course_payment_usecase.dart';
import 'package:get/get.dart';

class CoursePaymentUseCaseImpl implements CoursePaymentUseCase {
  final CoursePaymentRepository _coursePaymentRepository;
  CoursePaymentUseCaseImpl({
    required CoursePaymentRepository coursePaymentRepository,
  }) : _coursePaymentRepository = coursePaymentRepository;
  // @override
  // Future<void> create(CourseModel courseModel) =>
  //     _coursePaymentRepository.create(courseModel);

  // @override
  // Future<void> delete(String id) => _coursePaymentRepository.delete(id);

  @override
  Future<void> list(
          {required RxList<CoursePaymentModel> list,
          required String courseId,
          required String paymentType}) =>
      _coursePaymentRepository.list(
        list: list,
        courseId: courseId,
        paymentType: paymentType,
      );

  // @override
  // Future<ProductModel?> readById(String id) {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> update(CourseModel courseModel) =>
  //     _coursePaymentRepository.update(courseModel);

  // @override
  // Future<void> updateAddress(String productId, String addressId) =>
  //     _coursePaymentRepository.updateAddress(productId, addressId);

  // @override
  // void subscribe(
  //         {required RxList<ProductEntity> list, Pagination? pagination}) =>
  //     _coursePaymentRepository.subscribe(list: list, pagination: pagination);
}
