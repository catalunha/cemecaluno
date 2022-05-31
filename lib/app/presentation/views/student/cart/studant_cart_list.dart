import 'package:aluno/app/presentation/controllers/student/cart/student_cart_controller.dart';
import 'package:aluno/app/presentation/views/student/cart/student_cart_course_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentCartList extends StatelessWidget {
  final StudentCartController _studentCartController = Get.find();
  StudentCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        controller: ScrollController(),
        child: Wrap(
          children: _studentCartController.studentCartList
              .map((studentCart) => StudentCartCoursePayment(
                  coursePayment: studentCart.coursePayment))
              .toList(),
        ),
      ),
    );
  }
}
