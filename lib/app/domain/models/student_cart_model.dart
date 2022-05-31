import 'dart:convert';

import 'package:aluno/app/domain/models/course_payment_model.dart';
import 'package:aluno/app/domain/models/user_model.dart';

class StudentCartModel {
  final String? id;
  final UserModel? student;
  final CoursePaymentModel coursePayment;
  final bool generatedCob;
  StudentCartModel({
    this.id,
    this.student,
    required this.coursePayment,
    required this.generatedCob,
  });

  StudentCartModel copyWith({
    String? id,
    UserModel? student,
    CoursePaymentModel? coursePayment,
    bool? generatedCob,
  }) {
    return StudentCartModel(
      id: id ?? this.id,
      student: student ?? this.student,
      coursePayment: coursePayment ?? this.coursePayment,
      generatedCob: generatedCob ?? this.generatedCob,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student': student?.toMap(),
      'coursePayment': coursePayment.toMap(),
      'generatedCob': generatedCob,
    };
  }

  factory StudentCartModel.fromMap(Map<String, dynamic> map) {
    return StudentCartModel(
      id: map['id'],
      student:
          map['student'] != null ? UserModel.fromMap(map['student']) : null,
      coursePayment: CoursePaymentModel.fromMap(map['coursePayment']),
      generatedCob: map['generatedCob'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentCartModel.fromJson(String source) =>
      StudentCartModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentCartModel(id: $id, student: $student, coursePayment: $coursePayment, generatedCob: $generatedCob)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentCartModel &&
        other.id == id &&
        other.student == student &&
        other.coursePayment == coursePayment &&
        other.generatedCob == generatedCob;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        student.hashCode ^
        coursePayment.hashCode ^
        generatedCob.hashCode;
  }
}
