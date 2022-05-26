// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// import 'package:aluno/app/data/datasource/entity/component_entity.dart';
// import 'package:aluno/app/data/datasource/entity/user_profile_entity.dart';

// class CourseEntity {
//   // static const String className = 'Course';

//   final String? id;
//   final String name;
//   final String season;
//   final UserProfileEntity organizer;
//   final String program;

//   final String? community;
//   final String? image;
//   final String? description;

//   final UserProfileEntity? coordinator;
//   final List<UserProfileEntity>? teachers;
//   final List<ComponentEntity>? components;
//   final List<String>? componentsOrder;

//   CourseEntity({
//     this.id,
//     required this.name,
//     required this.season,
//     required this.organizer,
//     required this.program,
//     this.community,
//     this.image,
//     this.description,
//     this.coordinator,
//     this.teachers,
//     this.components,
//     this.componentsOrder,
//   });

//   //campo temp para gerenciar image
//   // ParseFileBase imageParseFileBase;

//   CourseEntity copyWith({
//     String? id,
//     String? name,
//     String? season,
//     UserProfileEntity? organizer,
//     String? program,
//     String? community,
//     String? image,
//     String? description,
//     UserProfileEntity? coordinator,
//     List<UserProfileEntity>? teachers,
//     List<ComponentEntity>? components,
//     List<String>? componentsOrder,
//   }) {
//     return CourseEntity(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       season: season ?? this.season,
//       organizer: organizer ?? this.organizer,
//       program: program ?? this.program,
//       community: community ?? this.community,
//       image: image ?? this.image,
//       description: description ?? this.description,
//       coordinator: coordinator ?? this.coordinator,
//       teachers: teachers ?? this.teachers,
//       components: components ?? this.components,
//       componentsOrder: componentsOrder ?? this.componentsOrder,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'season': season,
//       'organizer': organizer.toMap(),
//       'program': program,
//       'community': community,
//       'image': image,
//       'description': description,
//       'coordinator': coordinator?.toMap(),
//       'teachers': teachers?.map((x) => x?.toMap())?.toList(),
//       'components': components?.map((x) => x?.toMap())?.toList(),
//       'componentsOrder': componentsOrder,
//     };
//   }

//   factory CourseEntity.fromMap(Map<String, dynamic> map) {
//     return CourseEntity(
//       id: map['id'],
//       name: map['name'] ?? '',
//       season: map['season'] ?? '',
//       organizer: UserProfileEntity.fromMap(map['organizer']),
//       program: map['program'] ?? '',
//       community: map['community'],
//       image: map['image'],
//       description: map['description'],
//       coordinator: map['coordinator'] != null ? UserProfileEntity.fromMap(map['coordinator']) : null,
//       teachers: map['teachers'] != null ? List<UserProfileEntity>.from(map['teachers']?.map((x) => UserProfileEntity.fromMap(x))) : null,
//       components: map['components'] != null ? List<ComponentEntity>.from(map['components']?.map((x) => ComponentEntity.fromMap(x))) : null,
//       componentsOrder: List<String>.from(map['componentsOrder']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CourseEntity.fromJson(String source) => CourseEntity.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'CourseEntity(id: $id, name: $name, season: $season, organizer: $organizer, program: $program, community: $community, image: $image, description: $description, coordinator: $coordinator, teachers: $teachers, components: $components, componentsOrder: $componentsOrder)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is CourseEntity &&
//       other.id == id &&
//       other.name == name &&
//       other.season == season &&
//       other.organizer == organizer &&
//       other.program == program &&
//       other.community == community &&
//       other.image == image &&
//       other.description == description &&
//       other.coordinator == coordinator &&
//       listEquals(other.teachers, teachers) &&
//       listEquals(other.components, components) &&
//       listEquals(other.componentsOrder, componentsOrder);
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//       name.hashCode ^
//       season.hashCode ^
//       organizer.hashCode ^
//       program.hashCode ^
//       community.hashCode ^
//       image.hashCode ^
//       description.hashCode ^
//       coordinator.hashCode ^
//       teachers.hashCode ^
//       components.hashCode ^
//       componentsOrder.hashCode;
//   }
// }
