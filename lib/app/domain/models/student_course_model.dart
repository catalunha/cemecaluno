import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aluno/app/domain/models/course_model.dart';
import 'package:aluno/app/domain/models/user_model.dart';

class StudentCourseModel {
  final String? id;
  final UserModel user;
  final CourseModel course;
  final List<String>? componentsIfPaid;
  final List<String>? componentsCompleted;
  StudentCourseModel({
    this.id,
    required this.user,
    required this.course,
    this.componentsIfPaid,
    this.componentsCompleted,
  });

  StudentCourseModel copyWith({
    String? id,
    UserModel? user,
    CourseModel? course,
    List<String>? componentsIfPaid,
    List<String>? componentsCompleted,
  }) {
    return StudentCourseModel(
      id: id ?? this.id,
      user: user ?? this.user,
      course: course ?? this.course,
      componentsIfPaid: componentsIfPaid ?? this.componentsIfPaid,
      componentsCompleted: componentsCompleted ?? this.componentsCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user.toMap(),
      'course': course.toMap(),
      'componentsIfPaid': componentsIfPaid,
      'componentsCompleted': componentsCompleted,
    };
  }

  factory StudentCourseModel.fromMap(Map<String, dynamic> map) {
    return StudentCourseModel(
      id: map['id'],
      user: UserModel.fromMap(map['user']),
      course: CourseModel.fromMap(map['course']),
      componentsIfPaid: List<String>.from(map['componentsIfPaid']),
      componentsCompleted: List<String>.from(map['componentsCompleted']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentCourseModel.fromJson(String source) =>
      StudentCourseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentCourseModel(id: $id, user: $user, course: $course, componentsIfPaid: $componentsIfPaid, componentsCompleted: $componentsCompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentCourseModel &&
        other.id == id &&
        other.user == user &&
        other.course == course &&
        listEquals(other.componentsIfPaid, componentsIfPaid) &&
        listEquals(other.componentsCompleted, componentsCompleted);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        course.hashCode ^
        componentsIfPaid.hashCode ^
        componentsCompleted.hashCode;
  }
}
