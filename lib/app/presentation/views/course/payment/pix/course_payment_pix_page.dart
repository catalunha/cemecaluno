import 'package:aluno/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:aluno/app/presentation/controllers/course/payment/course_payment_controller.dart';
import 'package:aluno/app/presentation/controllers/home/course/offer/course_offer_controller.dart';
import 'package:aluno/app/presentation/views/home/course/offer/part/course_sale.dart';
import 'package:aluno/app/presentation/views/home/part/icon_name_function_profile.dart';
import 'package:aluno/app/presentation/views/home/part/organizer_profile.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePaymentPixPage extends StatefulWidget {
  final CourseOfferController _courseOfferController = Get.find();
  final CoursePaymentController _coursePaymentController = Get.find();
  final SplashController _splashController = Get.find();

  CoursePaymentPixPage({Key? key}) : super(key: key);

  @override
  State<CoursePaymentPixPage> createState() => _CoursePaymentPixPageState();
}

class _CoursePaymentPixPageState extends State<CoursePaymentPixPage> {
  String? paymentMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Suas opções de investimento'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 350,
          child: Card(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CourseSale(
                imageCourse: widget
                    ._courseOfferController.courseOffer!.course.imageIfNull,
                organizer: Organizer(
                  course:
                      widget._courseOfferController.courseOffer!.course.name,
                  program:
                      widget._courseOfferController.courseOffer!.course.program,
                  user: widget
                      ._splashController.userModel!.profile!.nameTagIfNull,
                  userProfileModel: widget
                      ._courseOfferController.courseOffer!.course.organizer,
                ),
                team: [
                  IconNameFunctionProfile(
                    name: widget._courseOfferController.courseOffer!.course
                        .coordinator!.nameTagIfNull,
                    photo: widget._courseOfferController.courseOffer!.course
                        .coordinator!.photoIfNull,
                    function: 'Coord.(a)',
                  ),
                  ...widget._courseOfferController.courseOffer!.course.teachers!
                      .map(
                    (teacher) {
                      return IconNameFunctionProfile(
                        name: teacher.nameTagIfNull,
                        photo: teacher.photoIfNull,
                        function: 'Prof.(a)',
                      );
                    },
                  ).toList()
                ],
                name: widget._courseOfferController.courseOffer!.course.name,
                turma: widget._courseOfferController.courseOffer!.course.season,
              ),
              const Divider(),
              const Text('Opções de pagamento com PIX'),
              Obx(
                () => Column(
                  children: widget
                      ._coursePaymentController.paymentModeOptions.keys
                      .map(
                    (key) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: key,
                            groupValue: paymentMode,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                paymentMode = key;
                              });
                            },
                          ),
                          Card(
                            color: Colors.green.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...widget._coursePaymentController
                                        .paymentModeOptions[key]!
                                        .map((e) => Text(e))
                                        .toList(),
                                    // const Divider()
                                  ]),
                            ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Incluir no carrinho.'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
