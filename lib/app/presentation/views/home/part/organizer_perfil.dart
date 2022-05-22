import 'package:aluno/app/presentation/views/utils/app_launch.dart';
import 'package:flutter/material.dart';

class OrganizerPerfil extends StatelessWidget {
  const OrganizerPerfil({
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
          child: Image.network(
            'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/1ff7d0e5a37032c8fd882be43f8f2388_woman4.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
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
