import 'package:aluno/app/data/repository/course_offer_repository.dart';
import 'package:aluno/app/domain/models/course_offer_model.dart';
import 'package:aluno/app/domain/usecases/course/offer/course_offer_usecase.dart';
import 'package:get/get.dart';

class CourseOfferUseCaseImpl implements CourseOfferUseCase {
  final CourseOfferRepository _courseOfferRepository;
  CourseOfferUseCaseImpl({
    required CourseOfferRepository courseOfferRepository,
  }) : _courseOfferRepository = courseOfferRepository;
  // @override
  // Future<void> create(CourseModel courseModel) =>
  //     _courseOfferRepository.create(courseModel);

  // @override
  // Future<void> delete(String id) => _courseOfferRepository.delete(id);

  @override
  Future<void> list(RxList<CourseOfferModel> list) =>
      _courseOfferRepository.list(list);

  // @override
  // Future<ProductModel?> readById(String id) {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> update(CourseModel courseModel) =>
  //     _courseOfferRepository.update(courseModel);

  // @override
  // Future<void> updateAddress(String productId, String addressId) =>
  //     _courseOfferRepository.updateAddress(productId, addressId);

  // @override
  // void subscribe(
  //         {required RxList<ProductEntity> list, Pagination? pagination}) =>
  //     _courseOfferRepository.subscribe(list: list, pagination: pagination);
}
