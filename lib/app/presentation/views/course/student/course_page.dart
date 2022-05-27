import 'package:aluno/app/presentation/controllers/course/student/student_course_controller.dart';
import 'package:aluno/app/presentation/views/course/student/component_info.dart';
import 'package:aluno/app/presentation/views/utils/app_appbar.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:aluno/app/presentation/views/utils/app_linear_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursePage extends StatelessWidget {
  final StudentCourseController _studentCourseController = Get.find();

  CoursePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final StudentCourseModel studentCourse = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppAppbar(
        title: Text(_studentCourseController.studentCourse!.course.name),
        // actions: [
        //   IconButton(
        //       onPressed: () => AppLaunch.launch(
        //           '${_studentCourseController.course!.community}'),
        //       icon: const Icon(
        //         Icons.discord,
        //         size: 40,
        //       ))
        // ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () => AppLaunch.launch(
                          '${_studentCourseController.studentCourse!.course.community}'),
                      icon: const Icon(
                        Icons.discord,
                        size: 40,
                      ),
                    ),
                    const Text('Comunidade')
                  ],
                ),
                Column(
                  children: [
                    _studentCourseController
                                .studentCourse!.course.organizer.photo ==
                            null
                        ? const Icon(Icons.person)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              _studentCourseController
                                  .studentCourse!.course.organizer.photo!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                    const Text('Organizador(a)'),
                  ],
                ),
                Column(
                  children: [
                    _studentCourseController
                                .studentCourse!.course.coordinator!.photo ==
                            null
                        ? const Icon(Icons.person)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              _studentCourseController
                                  .studentCourse!.course.coordinator!.photo!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                    const Text('Coordenador(a)')
                  ],
                )
              ],
            ),
          ),
          Obx(() => AppLinearPercentIndicator(
              width: 200,
              percent: _studentCourseController
                      .studentCourse!.componentsCompletedIfNull.length
                      .toDouble() /
                  (_studentCourseController
                      .studentCourse!.course.components!.length
                      .toDouble()))),
          Expanded(
            child: Wrap(
              children: [
                ..._studentCourseController.studentCourse!.course.components!
                    .map((component) {
                  return Obx(() => ComponentInfo(
                        component: component,
                        contentUnlocked: _studentCourseController
                            .studentCourse!.componentsIfPaidIfNull
                            .contains(component.id),
                        studentCourseId:
                            _studentCourseController.studentCourse!.id!,
                        contentCompleted: _studentCourseController
                            .studentCourse!.componentsCompletedIfNull
                            .contains(component.id),
                      ));
                }).toList(),
                // modulo(
                //   name: 'modulo 1',
                //   aula: 'aula 1',
                //   imageCourse:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                //   imageCoord:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/01fc68c2af7ade93ce5955afe9cabfbf_man1.png',
                //   imageProf:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/0b28345ecb39e2177d1746f80246ed70_woman2.png',
                // ),
                // modulo(
                //   name: 'modulo 1',
                //   aula: 'aula 2',
                //   imageCourse:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                //   imageCoord:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/425559a4c10df0add8d737d8bca4a347_woman1.png',
                //   imageProf:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/4d25fa84c39f08ac1dc1af1f3ab4fe84_woman3.png',
                // ),
                // modulo(
                //   name: 'modulo 1',
                //   aula: 'aula 2',
                //   imageCourse:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/cdec4477b1e99e9b98fb45f8be00ac1b_ventosa.jpg',
                //   imageCoord:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/425559a4c10df0add8d737d8bca4a347_woman1.png',
                //   imageProf:
                //       'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/4d25fa84c39f08ac1dc1af1f3ab4fe84_woman3.png',
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox modulo({
    required String name,
    required String aula,
    required String imageCourse,
    required String imageCoord,
    required String imageProf,
  }) {
    return SizedBox(
      width: 350,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(0),
                  ),
                  child: Image.network(
                    imageCourse,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        aula,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'É um curso bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text('Instrutores(as)'),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Tooltip(
                                    message: 'Coord.: nomeCoordenador(a)',
                                    child: Image.network(
                                      imageCoord,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Tooltip(
                                    message: 'Prof(a).: nomeProfessora',
                                    child: Image.network(
                                      imageProf,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       moduleChecked = !moduleChecked;
                //     });
                //   },
                //   icon: Icon(moduleChecked
                //       ? Icons.check_box_outlined
                //       : Icons.check_box_outline_blank),
                // ),
                IconButton(
                  onPressed: () => AppLaunch.launch(
                      'https://drive.google.com/drive/folders/1ON1pBql5EvaPx1RXFH8SGm9Uy8VC4T76?usp=sharing'),
                  icon: const Icon(Icons.folder),
                ),
                IconButton(
                  onPressed: () =>
                      AppLaunch.launch('https://youtu.be/_2bDOCTnbKc'),
                  icon: const Icon(Icons.ondemand_video),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
