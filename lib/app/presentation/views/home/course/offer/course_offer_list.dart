import 'package:aluno/app/presentation/controllers/home/course/offer/course_offer_controller.dart';
import 'package:aluno/app/presentation/views/home/course/offer/part/course_offer_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseOfferList extends StatelessWidget {
  final CourseOfferController _courseOfferController = Get.find();
  CourseOfferList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        controller: ScrollController(),
        child: Wrap(
          children: _courseOfferController.courseOfferList
              .map((courseOffer) => CourseOfferInfo(courseOffer: courseOffer))
              .toList(),
        ),
      ),
    );
  }
}
