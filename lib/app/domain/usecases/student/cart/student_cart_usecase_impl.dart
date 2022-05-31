import 'package:aluno/app/data/repository/student_cart_repository.dart';
import 'package:aluno/app/domain/models/student_cart_model.dart';
import 'package:aluno/app/domain/usecases/student/cart/student_cart_usecase.dart';
import 'package:get/get.dart';

class StudentCartUseCaseImpl implements StudentCartUseCase {
  final StudentCartRepository _studentCartRepository;
  StudentCartUseCaseImpl({
    required StudentCartRepository studentCartRepository,
  }) : _studentCartRepository = studentCartRepository;
  @override
  Future<void> create(StudentCartModel studentCartModel) async =>
      await _studentCartRepository.create(studentCartModel);

  @override
  Future<void> delete(String id) async =>
      await _studentCartRepository.delete(id);

  @override
  Future<void> list(RxList<StudentCartModel> list) async =>
      await _studentCartRepository.list(list);

  @override
  Future<void> update(StudentCartModel studentCartModel) async =>
      await _studentCartRepository.update(studentCartModel);

  // @override
  // Future<void> updateComponentsCompleted(
  //     {required String studentCartId,
  //     required String componentId,
  //     required bool add}) async {
  //   await _studentCartRepository.updateComponentsCompleted(
  //       studentCartId: studentCartId, componentId: componentId, add: add);
  // }

  // @override
  // Future<void> updateAddress(String productId, String addressId) =>
  //     _studentCartRepository.updateAddress(productId, addressId);

  // @override
  // void subscribe(
  //         {required RxList<ProductEntity> list, Pagination? pagination}) =>
  //     _studentCartRepository.subscribe(list: list, pagination: pagination);
}
