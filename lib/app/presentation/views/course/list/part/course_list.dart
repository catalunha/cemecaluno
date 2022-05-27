import 'package:aluno/app/presentation/controllers/student/course/student_course_controller.dart';
import 'package:aluno/app/presentation/views/course/list/part/course_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseList extends StatelessWidget {
  final StudentCourseController _studentCourseController = Get.find();
  // final List<CourseModel> courseList;
  // final Function() nextPage;
  // final bool lastPage;
  CourseList({
    Key? key,
    // required this.courseList,
    // required this.nextPage,
    // required this.lastPage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        controller: ScrollController(),
        child: Wrap(
          children: _studentCourseController.studentCourseList
              .map((studentCourse) => CourseInfo(studentCourse: studentCourse))
              .toList(),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     controller: ScrollController(),
  //     child: Wrap(
  //       children:
  //           courseList.map((course) => CourseInfo(course: course)).toList(),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: courseList.length,
  //     itemBuilder: (context, index) {
  //       final course = courseList[index];
  //       return CourseInfo(course: course);
  //     },
  //   );
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppAppbar(),
  //     body: Obx(
  //       () => ListView.builder(
  //         itemCount: productListController.courseList.length,
  //         itemBuilder: (context, index) {
  //           final product = productListController.courseList[index];
  //           return ProductInfo(product: product);
  //         },
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       // backgroundColor: context.primaryColor,
  //       onPressed: () {
  //         productListController.createProduct();
  //       },
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
}
