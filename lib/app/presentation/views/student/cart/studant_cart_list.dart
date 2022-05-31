import 'package:aluno/app/presentation/controllers/student/cart/student_cart_controller.dart';
import 'package:aluno/app/presentation/views/student/cart/part/student_cart_course_payment.dart';
import 'package:aluno/app/presentation/views/student/cart/part/student_cart_info.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentCartList extends StatelessWidget {
  final StudentCartController _studentCartController = Get.find();
  StudentCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: const Text('Meu carrinho'),
      ),
      body: Obx(
        () => Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Wrap(
              children:
                  _studentCartController.studentCartList.map((studentCart) {
                return SizedBox(
                    width: 350,
                    child: Card(
                        child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          StudentCartCoursePayment(
                              coursePayment: studentCart.coursePayment),
                          StudentCartInfo(studentCartModel: studentCart),
                        ])));

                // return StudentCartCoursePayment(
                //     coursePayment: studentCart.coursePayment);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
