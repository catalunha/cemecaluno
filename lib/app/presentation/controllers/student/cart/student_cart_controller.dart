import 'package:aluno/app/domain/models/student_cart_model.dart';
import 'package:aluno/app/domain/usecases/student/cart/student_cart_usecase.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/loader_mixin.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/message_mixin.dart';
import 'package:get/get.dart';

class StudentCartController extends GetxController
    with LoaderMixin, MessageMixin {
  final StudentCartUseCase _studentCartUseCase;
  StudentCartController({required StudentCartUseCase studentCartUseCase})
      : _studentCartUseCase = studentCartUseCase;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _studentCartList = <StudentCartModel>[].obs;
  List<StudentCartModel> get studentCartList => _studentCartList.toList();

  final _studentCart = Rxn<StudentCartModel>();
  StudentCartModel? get studentCart => _studentCart.value;
  // List<String>? componentsIfPaidCurrent;
  // final _pagination = Pagination().obs;
  // final _lastPage = false.obs;
  // get lastPage => _lastPage.value;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    list();
  }

  @override
  void onInit() {
    // ever(_pagination, (_) => subscribe());
    // _changePagination(1, 10);
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  // @override
  // void onReady() async {
  //   super.onReady();
  //   try {
  //     _loading.toggle();
  //     await findAll();
  //     _loading.toggle();
  //   } catch (e, s) {
  //     _loading.toggle();
  //     log(
  //       'Erro ao buscar produtos',
  //       error: e,
  //       stackTrace: s,
  //     );
  //     _message(MessageModel(
  //       title: 'Erro',
  //       message: 'Erro ao buscar menu',
  //     ));
  //   }
  // }
  Future<void> list() async {
    _loading.toggle();
    await _studentCartUseCase.list(_studentCartList);
    _loading.toggle();
  }
  // Future<void> findAll() async {
  //   final products = await _productRepository.findAll();
  //   menu.assignAll(products);
  // }

  // void _changePagination(int page, int limit) {
  //   _pagination.update((val) {
  //     val!.page = page;
  //     val.limit = limit;
  //   });
  // }

  // void nextPage() {
  //   _changePagination(_pagination.value.page + 1, _pagination.value.limit);
  // }

  // void createProduct() {
  //   Get.toNamed(Routes.productAppend, arguments: null);
  // }

  // void updateComponentsCompleted(
  //     String studentCartId, String componentId, bool add) async {
  //   _loading.toggle();
  //   await _studentCartUseCase.updateComponentsCompleted(
  //       studentCartId: studentCartId, componentId: componentId, add: add);
  //   await list();
  //   var studentCartTemp = studentCartList
  //       .firstWhere((element) => element.id == studentCartId);
  //   _studentCart(studentCartTemp);
  //   _studentCart.update((val) {
  //     val = studentCartTemp;
  //   });
  //   _loading.toggle();
  // }

  // void courseCurrent(String id) {
  //   print('courseCurrent: $id');
  //   var studentCartTemp =
  //       studentCartList.firstWhere((element) => element.id == id);
  //   _studentCart(studentCartTemp);
  //   // componentsIfPaidCurrent = studentCartTemp.componentsIfPaid;
  //   Get.toNamed(Routes.course);
  // }
}
