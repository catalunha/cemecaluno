import 'package:aluno/app/domain/models/user_profile_model.dart';
import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:flutter/material.dart';

class Organizer extends StatelessWidget {
  final UserProfileModel userProfileModel;
  final String program;
  final String user;
  final String course;
  const Organizer({
    Key? key,
    required this.userProfileModel,
    required this.program,
    required this.user,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Tooltip(
          message: '${userProfileModel.nameTagIfNull}. Organizadora',
          child: ClipOval(
            child: Image.network(
              userProfileModel.photoIfNull,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            InkWell(
              onTap: () => AppLaunch.launch(program),
              child: const Icon(Icons.web),
            ),
            InkWell(
              onTap: () => AppLaunch.launchWhatsApp(
                  phone: userProfileModel.phoneIfNull,
                  message:
                      'Usuária(o) do CEMEC-aluno: $user. Duvidas sobre o curso de $course.'),
              child: const Icon(Icons.whatsapp),
            )
          ],
        )
      ],
    );
  }
}
