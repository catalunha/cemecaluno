import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:aluno/app/domain/usecases/course/payment/course_payment_usecase.dart';
import 'package:aluno/app/presentation/controllers/home/course/offer/course_offer_controller.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/loader_mixin.dart';
import 'package:aluno/app/presentation/controllers/utils/mixins/message_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CoursePaymentController extends GetxController
    with LoaderMixin, MessageMixin {
  final CoursePaymentUseCase _coursePaymentUseCase;
  CoursePaymentController({required CoursePaymentUseCase coursePaymentUseCase})
      : _coursePaymentUseCase = coursePaymentUseCase;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final _coursePaymentList = <CoursePaymentModel>[].obs;
  List<CoursePaymentModel> get coursePaymentList => _coursePaymentList.toList();
  var paymentModeOptions = <String, List<String>>{}.obs;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    list();
  }

  Future<void> list() async {
    _loading.toggle();
    final CourseOfferController courseOfferController = Get.find();
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    await _coursePaymentUseCase.list(
      list: _coursePaymentList,
      courseId: courseOfferController.courseOffer!.course.id!,
      paymentType: courseOfferController.payWithSelected,
    );
    print('payment Selected');
    print(coursePaymentList);
    for (var element in coursePaymentList) {
      print(element.paymentMode);
      String data =
          '${element.paymentDescription}. Valor R\$${element.cost}.\nVenc. ${dateFormat.format(element.payDate)}. Multa ${element.feePerDay}%\n';
      if (paymentModeOptions.containsKey(element.paymentMode)) {
        paymentModeOptions[element.paymentMode]!.add(data);
      } else {
        paymentModeOptions.addAll({
          element.paymentMode: [data]
        });
      }
    }
    _loading.toggle();
  }
}
