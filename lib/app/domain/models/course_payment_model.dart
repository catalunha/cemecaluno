import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aluno/app/domain/models/course_model.dart';

class CoursePaymentModel {
  final String? id;
  final CourseModel course;
  final String cost;
  final String paymentType;
  final String paymentMode;
  final String paymentDescription;
  final int installment;
  final int installments;
  final DateTime payDate;
  final int? feePerDay;
  final List<String>? componentIfPaid;
  CoursePaymentModel({
    this.id,
    required this.course,
    required this.cost,
    required this.paymentType,
    required this.paymentMode,
    required this.paymentDescription,
    required this.installment,
    required this.installments,
    required this.payDate,
    this.feePerDay,
    this.componentIfPaid,
  });

  CoursePaymentModel copyWith({
    String? id,
    CourseModel? course,
    String? cost,
    String? paymentType,
    String? paymentMode,
    String? paymentDescription,
    int? installment,
    int? installments,
    DateTime? payDate,
    int? feePerDay,
    List<String>? componentIfPaid,
  }) {
    return CoursePaymentModel(
      id: id ?? this.id,
      course: course ?? this.course,
      cost: cost ?? this.cost,
      paymentType: paymentType ?? this.paymentType,
      paymentMode: paymentMode ?? this.paymentMode,
      paymentDescription: paymentDescription ?? this.paymentDescription,
      installment: installment ?? this.installment,
      installments: installments ?? this.installments,
      payDate: payDate ?? this.payDate,
      feePerDay: feePerDay ?? this.feePerDay,
      componentIfPaid: componentIfPaid ?? this.componentIfPaid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course': course.toMap(),
      'cost': cost,
      'paymentType': paymentType,
      'paymentMode': paymentMode,
      'paymentDescription': paymentDescription,
      'installment': installment,
      'installments': installments,
      'payDate': payDate.millisecondsSinceEpoch,
      'feePerDay': feePerDay,
      'componentIfPaid': componentIfPaid,
    };
  }

  factory CoursePaymentModel.fromMap(Map<String, dynamic> map) {
    return CoursePaymentModel(
      id: map['id'],
      course: CourseModel.fromMap(map['course']),
      cost: map['cost'] ?? '',
      paymentType: map['paymentType'] ?? '',
      paymentMode: map['paymentMode'] ?? '',
      paymentDescription: map['paymentDescription'] ?? '',
      installment: map['installment']?.toInt() ?? 0,
      installments: map['installments']?.toInt() ?? 0,
      payDate: DateTime.fromMillisecondsSinceEpoch(map['payDate']),
      feePerDay: map['feePerDay']?.toInt(),
      componentIfPaid: List<String>.from(map['componentIfPaid']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursePaymentModel.fromJson(String source) =>
      CoursePaymentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoursePaymentModel(id: $id, course: $course, cost: $cost, paymentType: $paymentType, paymentMode: $paymentMode, paymentDescription: $paymentDescription, installment: $installment, installments: $installments, payDate: $payDate, feePerDay: $feePerDay, componentIfPaid: $componentIfPaid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoursePaymentModel &&
        other.id == id &&
        other.course == course &&
        other.cost == cost &&
        other.paymentType == paymentType &&
        other.paymentMode == paymentMode &&
        other.paymentDescription == paymentDescription &&
        other.installment == installment &&
        other.installments == installments &&
        other.payDate == payDate &&
        other.feePerDay == feePerDay &&
        listEquals(other.componentIfPaid, componentIfPaid);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        course.hashCode ^
        cost.hashCode ^
        paymentType.hashCode ^
        paymentMode.hashCode ^
        paymentDescription.hashCode ^
        installment.hashCode ^
        installments.hashCode ^
        payDate.hashCode ^
        feePerDay.hashCode ^
        componentIfPaid.hashCode;
  }
}
