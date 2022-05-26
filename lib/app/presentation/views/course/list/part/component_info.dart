import 'package:aluno/app/domain/models/component_model.dart';
import 'package:aluno/app/presentation/controllers/course/list/course_list_controller.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentInfo extends StatelessWidget {
  final CourseListController _courseListController = Get.find();

  final ComponentModel component;
  ComponentInfo({Key? key, required this.component}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    component.image!,
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
                        component.module,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        component.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        component.description!,
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
                                  ...component.teachers.map(
                                    (teacher) {
                                      return Tooltip(
                                        message: 'Prof(a).: ${teacher.nameTag}',
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                  //   message: 'Coord.: nomeCoordenador(a)',
                                  //   child: Image.network(
                                  //     imageCoord,
                                  //     width: 50,
                                  //     height: 50,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  // Tooltip(
                                  //   message: 'Prof(a).: nomeProfessora',
                                  //   child: Image.network(
                                  //     imageProf,
                                  //     width: 50,
                                  //     height: 50,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
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
                  onPressed: () => AppLaunch.launch(component.folder),
                  icon: const Icon(Icons.folder),
                ),
                IconButton(
                  onPressed: () => AppLaunch.launch(component.video),
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
