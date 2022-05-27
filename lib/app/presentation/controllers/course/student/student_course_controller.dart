import 'package:aluno/app/domain/models/student_course_model.dart';
import 'package:aluno/app/domain/usecases/student/course/student_course_usecase.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/loader_mixin.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/message_mixin.dart';
import 'package:aluno/app/routes.dart';
import 'package:get/get.dart';

class StudentCourseController extends GetxController
    with LoaderMixin, MessageMixin {
  final StudentCourseUseCase _studentCourseUseCase;
  StudentCourseController({required StudentCourseUseCase studentCourseUseCase})
      : _studentCourseUseCase = studentCourseUseCase;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _studentCourseList = <StudentCourseModel>[].obs;
  List<StudentCourseModel> get studentCourseList => _studentCourseList.toList();

  final _studentCourse = Rxn<StudentCourseModel>();
  StudentCourseModel? get studentCourse => _studentCourse.value;
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
    await _studentCourseUseCase.list(_studentCourseList);
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

  void updateComponentsCompleted(
      String studentCourseId, String componentId, bool add) async {
    _loading.toggle();
    await _studentCourseUseCase.updateComponentsCompleted(
        studentCourseId: studentCourseId, componentId: componentId, add: add);
    await list();
    var studentCourseTemp = studentCourseList
        .firstWhere((element) => element.id == studentCourseId);
    _studentCourse(studentCourseTemp);
    _studentCourse.update((val) {
      val = studentCourseTemp;
    });
    _loading.toggle();
  }

  void courseCurrent(String id) {
    print('courseCurrent: $id');
    var studentCourseTemp =
        studentCourseList.firstWhere((element) => element.id == id);
    _studentCourse(studentCourseTemp);
    // componentsIfPaidCurrent = studentCourseTemp.componentsIfPaid;
    Get.toNamed(Routes.course);
  }
}
