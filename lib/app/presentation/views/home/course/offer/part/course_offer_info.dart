import 'package:aluno/app/domain/models/course_offer_model.dart';
import 'package:aluno/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:aluno/app/presentation/views/home/course/offer/part/course_sale.dart';
import 'package:aluno/app/presentation/views/home/part/icon_name_function_profile.dart';
import 'package:aluno/app/presentation/views/home/part/organizer_profile.dart';
import 'package:aluno/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseOfferInfo extends StatelessWidget {
  // final CourseOfferController _courseOfferController = Get.find();
  final SplashController _splashController = Get.find();
  final CourseOfferModel courseOffer;
  CourseOfferInfo({Key? key, required this.courseOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseSale(
              imageCourse: courseOffer.course.imageIfNull,
              organizer: Organizer(
                course: courseOffer.course.name,
                program: courseOffer.course.program,
                user: _splashController.userModel!.profile!.nameTagIfNull,
                userProfileModel: courseOffer.course.organizer,
              ),
              team: [
                IconNameFunctionProfile(
                  name: courseOffer.course.coordinator!.nameTagIfNull,
                  photo: courseOffer.course.coordinator!.photoIfNull,
                  function: 'Coord.(a)',
                ),
                ...courseOffer.course.teachers!.map(
                  (teacher) {
                    return IconNameFunctionProfile(
                      name: teacher.nameTagIfNull,
                      photo: teacher.photoIfNull,
                      function: 'Prof.(a)',
                    );
                  },
                ).toList()
              ],
              name: courseOffer.course.name,
              turma: courseOffer.course.season,
            ),
            Column(
              children: [
                // Text('courseOffer.id: ${courseOffer.id}'),
                Text(
                  '${courseOffer.msgOpenUntil}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                      color: Colors.green,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '${courseOffer.msgCost}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const Text('Modalidades de pagamento:'),
                    courseOffer.payWith!.contains('pix')
                        ? InkWell(
                            onTap: () {
                              Get.toNamed(Routes.purchaseCart,
                                  arguments: 'pix');
                            },
                            child: const Icon(Icons.pix),
                          )
                        : const SizedBox(),
                    courseOffer.payWith!.contains('boleto')
                        ? InkWell(
                            onTap: () {
                              Get.toNamed(Routes.purchaseCart,
                                  arguments: 'bankslip');
                            },
                            child: const Icon(Icons.sticky_note_2),
                          )
                        : const SizedBox(),
                    courseOffer.payWith!.contains('cartao')
                        ? InkWell(
                            onTap: () {
                              Get.toNamed(Routes.purchaseCart,
                                  arguments: 'card');
                            },
                            child: const Icon(Icons.credit_card),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
