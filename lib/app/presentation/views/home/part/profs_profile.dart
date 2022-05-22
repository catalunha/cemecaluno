import 'package:flutter/material.dart';

class ProfsProfile extends StatelessWidget {
  const ProfsProfile({
    Key? key,
    required this.imageProf,
  }) : super(key: key);

  final String imageProf;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tooltip(
          message: 'Prof(a).: nomeProfessora',
          child: Image.network(
            imageProf,
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
    );
  }
}
