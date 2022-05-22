import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:flutter/material.dart';

class OrganizerProfile extends StatelessWidget {
  const OrganizerProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Tooltip(
          message: 'Izaira. Organizadora',
          child: ClipOval(
            child: Image.network(
              'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/297bf3dcf5dc829d9e1933db26fd4cf6_izatar.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            InkWell(
              onTap: () => AppLaunch.launch('https://cemec.net.br'),
              child: const Icon(Icons.web),
            ),
            InkWell(
              onTap: () => AppLaunch.launchWhatsApp(
                  phone: '5533988053701',
                  message:
                      'Sou a Izáira. Posso ajudar-lhe sobre algum curso do CEMEC ?'),
              child: const Icon(Icons.whatsapp),
            )
          ],
        )
      ],
    );
  }
}
