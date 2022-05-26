import 'package:aluno/app/domain/models/course_model.dart';
import 'package:aluno/app/presentation/controllers/course/list/course_list_controller.dart';
import 'package:aluno/app/presentation/views/home/part/course_icon.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseInfo extends StatelessWidget {
  final CourseListController _courseListController = Get.find();

  final CourseModel course;
  CourseInfo({Key? key, required this.course}) : super(key: key);

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
              course.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              course.season,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  // Get.toNamed(Routes.course);
                  _courseListController.courseCurrent(course.id!);
                },
                child: CourseIcon(imageCourse: course.image)),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                course.community == null
                    ? const SizedBox()
                    : InkWell(
                        onTap: () => AppLaunch.launch(course.community!),
                        child: const Icon(
                          Icons.discord,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tooltip(
                      message: 'Coord.: ${course.coordinator!.nameTag}',
                      child: course.coordinator!.photo == null
                          ? const Icon(Icons.person)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                course.coordinator!.photo!,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ],
                ),
                ...course.teachers!.map(
                  (teacher) {
                    return Tooltip(
                      message: 'Prof(a).: ${teacher.nameTag}',
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
            // const AppLinearPercentIndicator(percent: 0.213),
          ],
        ),
      ),
    );
  }
}
