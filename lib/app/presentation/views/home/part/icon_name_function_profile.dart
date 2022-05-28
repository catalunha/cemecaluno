import 'package:flutter/material.dart';

class IconNameFunctionProfile extends StatelessWidget {
  const IconNameFunctionProfile({
    Key? key,
    required this.photo,
    required this.name,
    required this.function,
  }) : super(key: key);

  final String name;
  final String photo;
  final String function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tooltip(
          message: '$function: $name',
          child: Image.network(
            photo,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        // Tooltip(
        //   message: 'Prof(a).: nomeProfessora',
        //   child: Image.network(
        //     photo,
        //     width: 50,
        //     height: 50,
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ],
    );
  }
}
