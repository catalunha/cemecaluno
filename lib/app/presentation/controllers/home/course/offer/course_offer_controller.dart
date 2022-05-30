import 'package:aluno/app/domain/models/course_offer_model.dart';
import 'package:aluno/app/domain/usecases/course/offer/course_offer_usecase.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/loader_mixin.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/message_mixin.dart';
import 'package:aluno/app/routes.dart';
import 'package:get/get.dart';

class CourseOfferController extends GetxController
    with LoaderMixin, MessageMixin {
  final CourseOfferUseCase _courseOfferUseCase;
  CourseOfferController({required CourseOfferUseCase courseOfferUseCase})
      : _courseOfferUseCase = courseOfferUseCase;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _courseOfferList = <CourseOfferModel>[].obs;
  List<CourseOfferModel> get courseOfferList => _courseOfferList.toList();

  final _courseOffer = Rxn<CourseOfferModel>();
  CourseOfferModel? get courseOffer => _courseOffer.value;
  String payWithSelected = '';
  // List<String>? componentsIfPaidCurrent;
  // final _pagination = Pagination().obs;
  // final _lastPage = false.obs;
  // get lastPage => _lastPage.value;

  @override
  void onInit() {
    // ever(_pagination, (_) => subscribe());
    // _changePagination(1, 10);
    list();
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
    await _courseOfferUseCase.list(_courseOfferList);
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
  //     String studentCourseId, String componentId, bool add) async {
  //   _loading.toggle();
  //   await _courseOfferUseCase.updateComponentsCompleted(
  //       studentCourseId: studentCourseId, componentId: componentId, add: add);
  //   await list();
  //   var studentCourseTemp = courseOfferList
  //       .firstWhere((element) => element.id == studentCourseId);
  //   _courseOffer(studentCourseTemp);
  //   _courseOffer.update((val) {
  //     val = studentCourseTemp;
  //   });
  //   _loading.toggle();
  // }

  void setPayment(String courseOfferId, String payWith) {
    print('courseOfferCurrent: $courseOfferId');
    var courseOfferTemp =
        courseOfferList.firstWhere((element) => element.id == courseOfferId);
    _courseOffer(courseOfferTemp);
    // componentsIfPaidCurrent = studentCourseTemp.componentsIfPaid;
    payWithSelected = payWith;
    if (payWith == 'pix') {
      Get.toNamed(Routes.coursePaymentPix);
    }
  }

  void courseCurrent(String id) {
    print('courseOfferCurrent: $id');
    var courseOfferTemp =
        courseOfferList.firstWhere((element) => element.id == id);
    _courseOffer(courseOfferTemp);
    // componentsIfPaidCurrent = studentCourseTemp.componentsIfPaid;
    Get.toNamed(Routes.course);
  }
}
