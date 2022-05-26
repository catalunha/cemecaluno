// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

// import 'package:aluno/app/data/datasource/entity/user_profile_entity.dart';

// class ComponentModel {
//   // static const String className = 'Component';

//   final String? id;
//   final String module;
//   final String name;
//   final String folder;
//   final String video;
//   final List<UserProfileEntity> teachers;

//   final String? image;
//   ParseFileBase? imageParseFileBase; //campo temp para gerenciar image
//   final String? description;
//   final String? pluscode;
//   ComponentModel({
//     this.id,
//     required this.module,
//     required this.name,
//     required this.folder,
//     required this.video,
//     required this.teachers,
//     this.image,
//     this.imageParseFileBase,
//     this.description,
//     this.pluscode,
//   });

//   ComponentModel copyWith({
//     String? id,
//     String? module,
//     String? name,
//     String? folder,
//     String? video,
//     List<UserProfileEntity>? teachers,
//     String? image,
//     ParseFileBase? imageParseFileBase,
//     String? description,
//     String? pluscode,
//   }) {
//     return ComponentModel(
//       id: id ?? this.id,
//       module: module ?? this.module,
//       name: name ?? this.name,
//       folder: folder ?? this.folder,
//       video: video ?? this.video,
//       teachers: teachers ?? this.teachers,
//       image: image ?? this.image,
//       imageParseFileBase: imageParseFileBase ?? this.imageParseFileBase,
//       description: description ?? this.description,
//       pluscode: pluscode ?? this.pluscode,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'module': module,
//       'name': name,
//       'folder': folder,
//       'video': video,
//       'teachers': teachers.map((x) => x.toMap()).toList(),
//       'image': image,
//       'description': description,
//       'pluscode': pluscode,
//     };
//   }

//   factory ComponentModel.fromMap(Map<String, dynamic> map) {
//     return ComponentModel(
//       id: map['id'],
//       module: map['module'] ?? '',
//       name: map['name'] ?? '',
//       folder: map['folder'] ?? '',
//       video: map['video'] ?? '',
//       teachers: List<UserProfileEntity>.from(
//           map['teachers']?.map((x) => UserProfileEntity.fromMap(x))),
//       image: map['image'],
//       description: map['description'],
//       pluscode: map['pluscode'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ComponentModel.fromJson(String source) =>
//       ComponentModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'ComponentModel(id: $id, module: $module, name: $name, folder: $folder, video: $video, teachers: $teachers, image: $image, imageParseFileBase: $imageParseFileBase, description: $description, pluscode: $pluscode)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ComponentModel &&
//         other.id == id &&
//         other.module == module &&
//         other.name == name &&
//         other.folder == folder &&
//         other.video == video &&
//         listEquals(other.teachers, teachers) &&
//         other.image == image &&
//         other.imageParseFileBase == imageParseFileBase &&
//         other.description == description &&
//         other.pluscode == pluscode;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         module.hashCode ^
//         name.hashCode ^
//         folder.hashCode ^
//         video.hashCode ^
//         teachers.hashCode ^
//         image.hashCode ^
//         imageParseFileBase.hashCode ^
//         description.hashCode ^
//         pluscode.hashCode;
//   }
// }
