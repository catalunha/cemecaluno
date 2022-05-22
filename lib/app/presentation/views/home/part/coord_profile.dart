import 'package:flutter/material.dart';

class CoordProfile extends StatelessWidget {
  const CoordProfile({
    Key? key,
    required this.imageCoord,
  }) : super(key: key);

  final String imageCoord;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Coord.: nomeCoordenador(a)',
      child: Image.network(
        imageCoord,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
