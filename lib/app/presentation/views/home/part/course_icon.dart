import 'package:flutter/material.dart';

class CourseIcon extends StatelessWidget {
  const CourseIcon({
    Key? key,
    required this.imageCourse,
  }) : super(key: key);

  final String imageCourse;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(30),
        topLeft: Radius.circular(30),
        topRight: Radius.circular(0),
      ),
      child: Image.network(
        imageCourse,
        width: 80,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}
