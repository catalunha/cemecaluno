import 'dart:convert';

import 'package:aluno/app/domain/models/component_model.dart';
import 'package:aluno/app/domain/models/user_profile_model.dart';
import 'package:flutter/foundation.dart';

class CourseModel {
  final String? id;
  final String name;
  final String season;
  final UserProfileModel organizer;
  final String program;

  final String? community;
  final String? image;
  final String? description;

  final UserProfileModel? coordinator;
  final List<UserProfileModel>? teachers;
  final List<ComponentModel>? components;
  final List<String>? componentsOrder;
  String get imageIfNull =>
      image ??
      'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/f389e44898e39009c150036849858916_oops.png';

  CourseModel({
    this.id,
    required this.name,
    required this.season,
    required this.organizer,
    required this.program,
    this.community,
    this.image,
    this.description,
    this.coordinator,
    this.teachers,
    this.components,
    this.componentsOrder,
  });

  //campo temp para gerenciar image
  // ParseFileBase imageParseFileBase;

  CourseModel copyWith({
    String? id,
    String? name,
    String? season,
    UserProfileModel? organizer,
    String? program,
    String? community,
    String? image,
    String? description,
    UserProfileModel? coordinator,
    List<UserProfileModel>? teachers,
    List<ComponentModel>? components,
    List<String>? componentsOrder,
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      season: season ?? this.season,
      organizer: organizer ?? this.organizer,
      program: program ?? this.program,
      community: community ?? this.community,
      image: image ?? this.image,
      description: description ?? this.description,
      coordinator: coordinator ?? this.coordinator,
      teachers: teachers ?? this.teachers,
      components: components ?? this.components,
      componentsOrder: componentsOrder ?? this.componentsOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'season': season,
      'organizer': organizer.toMap(),
      'program': program,
      'community': community,
      'image': image,
      'description': description,
      'coordinator': coordinator?.toMap(),
      'teachers': teachers?.map((x) => x.toMap()).toList(),
      'components': components?.map((x) => x.toMap()).toList(),
      'componentsOrder': componentsOrder,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      name: map['name'] ?? '',
      season: map['season'] ?? '',
      organizer: UserProfileModel.fromMap(map['organizer']),
      program: map['program'] ?? '',
      community: map['community'],
      image: map['image'],
      description: map['description'],
      coordinator: map['coordinator'] != null
          ? UserProfileModel.fromMap(map['coordinator'])
          : null,
      teachers: map['teachers'] != null
          ? List<UserProfileModel>.from(
              map['teachers']?.map((x) => UserProfileModel.fromMap(x)))
          : null,
      components: map['components'] != null
          ? List<ComponentModel>.from(
              map['components']?.map((x) => ComponentModel.fromMap(x)))
          : null,
      componentsOrder: List<String>.from(map['componentsOrder']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseModel(id: $id, name: $name, season: $season, organizer: $organizer, program: $program, community: $community, image: $image, description: $description, coordinator: $coordinator, teachers: $teachers, components: $components, componentsOrder: $componentsOrder)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModel &&
        other.id == id &&
        other.name == name &&
        other.season == season &&
        other.organizer == organizer &&
        other.program == program &&
        other.community == community &&
        other.image == image &&
        other.description == description &&
        other.coordinator == coordinator &&
        listEquals(other.teachers, teachers) &&
        listEquals(other.components, components) &&
        listEquals(other.componentsOrder, componentsOrder);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        season.hashCode ^
        organizer.hashCode ^
        program.hashCode ^
        community.hashCode ^
        image.hashCode ^
        description.hashCode ^
        coordinator.hashCode ^
        teachers.hashCode ^
        components.hashCode ^
        componentsOrder.hashCode;
  }
}
