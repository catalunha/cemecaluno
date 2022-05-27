import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aluno/app/domain/models/course_model.dart';

class CourseOfferModel {
  final String? id;
  final CourseModel course;
  final String? msgCost;
  final String? msgOpenUntil;
  final int? vacancies;
  final List<String>? payWith;
  final int? order;
  CourseOfferModel({
    this.id,
    required this.course,
    this.msgCost,
    this.msgOpenUntil,
    this.vacancies,
    this.payWith,
    this.order,
  });

  CourseOfferModel copyWith({
    String? id,
    CourseModel? course,
    String? msgCost,
    String? msgOpenUntil,
    int? vacancies,
    List<String>? payWith,
    int? order,
  }) {
    return CourseOfferModel(
      id: id ?? this.id,
      course: course ?? this.course,
      msgCost: msgCost ?? this.msgCost,
      msgOpenUntil: msgOpenUntil ?? this.msgOpenUntil,
      vacancies: vacancies ?? this.vacancies,
      payWith: payWith ?? this.payWith,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course': course.toMap(),
      'msgCost': msgCost,
      'msgOpenUntil': msgOpenUntil,
      'vacancies': vacancies,
      'payWith': payWith,
      'order': order,
    };
  }

  factory CourseOfferModel.fromMap(Map<String, dynamic> map) {
    return CourseOfferModel(
      id: map['id'],
      course: CourseModel.fromMap(map['course']),
      msgCost: map['msgCost'],
      msgOpenUntil: map['msgOpenUntil'],
      vacancies: map['vacancies']?.toInt(),
      payWith: List<String>.from(map['payWith']),
      order: map['order']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseOfferModel.fromJson(String source) =>
      CourseOfferModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseOfferModel(id: $id, course: $course, msgCost: $msgCost, msgOpenUntil: $msgOpenUntil, vacancies: $vacancies, payWith: $payWith, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseOfferModel &&
        other.id == id &&
        other.course == course &&
        other.msgCost == msgCost &&
        other.msgOpenUntil == msgOpenUntil &&
        other.vacancies == vacancies &&
        listEquals(other.payWith, payWith) &&
        other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        course.hashCode ^
        msgCost.hashCode ^
        msgOpenUntil.hashCode ^
        vacancies.hashCode ^
        payWith.hashCode ^
        order.hashCode;
  }
}
