import 'package:aluno/app/presentation/views/home/part/course_icon.dart';
import 'package:flutter/material.dart';

class CourseSale extends StatelessWidget {
  final String imageCourse;
  final String name;
  final String turma;
  final Widget organizer;
  final List<Widget> team;

  const CourseSale({
    Key? key,
    required this.imageCourse,
    required this.name,
    required this.turma,
    required this.organizer,
    required this.team,
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
                        children: [...team],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Dúvidas:'),
                      organizer,
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
