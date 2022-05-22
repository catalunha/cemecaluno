import 'package:aluno/app/presentation/views/home/part/coord_profile.dart';
import 'package:aluno/app/presentation/views/home/part/course_icon.dart';
import 'package:aluno/app/presentation/views/home/part/organizer_profile.dart';
import 'package:aluno/app/presentation/views/home/part/profs_profile.dart';
import 'package:flutter/material.dart';

class CourseSale extends StatelessWidget {
  final String imageCourse;
  final String name;
  final String turma;
  final String imageCoord;
  final String imageProf;

  const CourseSale({
    Key? key,
    required this.imageCourse,
    required this.name,
    required this.turma,
    required this.imageCoord,
    required this.imageProf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CourseIcon(imageCourse: imageCourse),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                turma,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Incrições até: 10-06-2022 as 23:59',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Equipe:'),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CoordProfile(imageCoord: imageCoord),
                          ProfsProfile(imageProf: imageProf)
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Dúvidas:'),
                      OrganizerProfile(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
