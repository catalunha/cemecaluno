import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserProfileModel {
  static const String className = 'Profile';

  final String? id;
  final String? fullName;
  final String? nameTag;
  final String? description;
  final bool? isWoman;
  final String? photo;
  final String? discord;
  final String? telegram;
  //campo temp para gerenciar
  ParseFileBase? photoParseFileBase;

  UserProfileModel({
    this.id,
    this.fullName,
    this.nameTag,
    this.description,
    this.isWoman,
    this.photo,
    this.discord,
    this.telegram,
  });

  UserProfileModel copyWith({
    String? id,
    String? fullName,
    String? nameTag,
    String? description,
    bool? isWoman,
    String? photo,
    String? discord,
    String? telegram,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      fullName: fullName ?? fullName,
      nameTag: nameTag ?? this.nameTag,
      description: description ?? this.description,
      isWoman: isWoman ?? this.isWoman,
      photo: photo ?? this.photo,
      discord: discord ?? this.discord,
      telegram: telegram ?? this.telegram,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'nameTag': nameTag,
      'description': description,
      'isWoman': isWoman,
      'photo': photo,
      'discord': discord,
      'telegram': telegram,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'],
      fullName: map['fullName'],
      nameTag: map['nameTag'],
      description: map['description'],
      isWoman: map['isWoman'],
      photo: map['photo'],
      discord: map['discord'],
      telegram: map['telegram'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfileModel(id: $id, fullname: $fullName, nameTag: $nameTag, isWoman: $isWoman, photo: $photo, discord: $discord, telegram: $telegram, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileModel &&
        other.id == id &&
        other.fullName == fullName &&
        other.nameTag == nameTag &&
        other.description == description &&
        other.isWoman == isWoman &&
        other.photo == photo &&
        other.discord == discord &&
        other.telegram == telegram;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        nameTag.hashCode ^
        description.hashCode ^
        isWoman.hashCode ^
        photo.hashCode ^
        discord.hashCode ^
        telegram.hashCode;
  }
}
