import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:aluno/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:aluno/app/presentation/views/home/course/offer/part/course_sale.dart';
import 'package:aluno/app/presentation/views/home/part/icon_name_function_profile.dart';
import 'package:aluno/app/presentation/views/home/part/organizer_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentCartCoursePayment extends StatelessWidget {
  final SplashController _splashController = Get.find();
  final CoursePaymentModel coursePayment;
  StudentCartCoursePayment({Key? key, required this.coursePayment})
      : super(key: key);

  final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
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
              imageCourse: coursePayment.course.imageIfNull,
              organizer: Organizer(
                course: coursePayment.course.name,
                program: coursePayment.course.program,
                user: _splashController.userModel!.profile!.nameTagIfNull,
                userProfileModel: coursePayment.course.organizer,
              ),
              team: [
                IconNameFunctionProfile(
                  name: coursePayment.course.coordinator!.nameTagIfNull,
                  photo: coursePayment.course.coordinator!.photoIfNull,
                  function: 'Coord.(a)',
                ),
                ...coursePayment.course.teachers!.map(
                  (teacher) {
                    return IconNameFunctionProfile(
                      name: teacher.nameTagIfNull,
                      photo: teacher.photoIfNull,
                      function: 'Prof.(a)',
                    );
                  },
                ).toList()
              ],
              name: coursePayment.course.name,
              turma: coursePayment.course.season,
            ),
            const Divider(),
            const Center(child: Text('Etapa de investimento neste curso')),
            Center(child: Text('Código do item: ${coursePayment.id}')),
            Text(coursePayment.paymentDescription),
            Text('Custo R\$${coursePayment.cost}'),
            Text('Vencimento: ${dateFormat.format(coursePayment.payDate)}'),
          ],
        ),
      ),
    );
  }
}
