import 'package:aluno/app/domain/models/student_course_model.dart';
import 'package:aluno/app/presentation/controllers/student/course/student_course_controller.dart';
import 'package:aluno/app/presentation/views/home/part/course_icon.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/presentation/views/utils/app_linear_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseInfo extends StatelessWidget {
  final StudentCourseController _studentCourseController = Get.find();

  final StudentCourseModel studentCourse;
  CourseInfo({Key? key, required this.studentCourse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              studentCourse.course.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              studentCourse.course.season,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  // Get.toNamed(Routes.course);
                  _studentCourseController.courseCurrent(studentCourse.id!);
                },
                child: CourseIcon(imageCourse: studentCourse.course.image)),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                studentCourse.course.community == null
                    ? const SizedBox()
                    : InkWell(
                        onTap: () =>
                            AppLaunch.launch(studentCourse.course.community!),
                        child: const Icon(
                          Icons.discord,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                Tooltip(
                  message:
                      'Coord.: ${studentCourse.course.coordinator!.nameTagIfNull}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      studentCourse.course.coordinator!.photoIfNull,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ...studentCourse.course.teachers!.map(
                  (teacher) {
                    return Tooltip(
                      message: 'Prof(a).: ${teacher.nameTagIfNull}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          teacher.photo!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ).toList(),
                // Tooltip(
                //   message: 'Prof(a).: nomeProfessora',
                //   child: Image.network(
                //     imageProf,
                //     width: 40,
                //     height: 40,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                // Tooltip(
                //   message: 'Prof(a).: nomeProfessora',
                //   child: Image.network(
                //     imageProf,
                //     width: 40,
                //     height: 40,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
            AppLinearPercentIndicator(
                percent:
                    studentCourse.componentsCompletedIfNull.length.toDouble() /
                        (studentCourse.course.components!.length.toDouble())),
          ],
        ),
      ),
    );
  }
}
