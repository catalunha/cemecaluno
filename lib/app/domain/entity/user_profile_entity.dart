import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserProfileEntity {
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

  UserProfileEntity({
    this.id,
    this.fullName,
    this.nameTag,
    this.description,
    this.isWoman,
    this.photo,
    this.discord,
    this.telegram,
  });

  UserProfileEntity copyWith({
    String? id,
    String? fullName,
    String? nameTag,
    String? description,
    bool? isWoman,
    String? photo,
    String? discord,
    String? telegram,
  }) {
    return UserProfileEntity(
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

  factory UserProfileEntity.fromMap(Map<String, dynamic> map) {
    return UserProfileEntity(
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

  factory UserProfileEntity.fromJson(String source) =>
      UserProfileEntity.fromMap(json.decode(source));

  factory UserProfileEntity.fromParse(ParseObject parseObject) {
    UserProfileEntity userProfileEntity = UserProfileEntity(
      id: parseObject.objectId!,
      fullName: parseObject.get('fullName'),
      nameTag: parseObject.get('nameTag'),
      description: parseObject.get('description'),
      isWoman: parseObject.get('isWoman'),
      photo: parseObject.get('photo')?.get('url'),

      // photo: parseObject.get('photo') != null
      //     ? parseObject.get('photo')?.get('url')
      //     : null,
      discord: parseObject.get('discord'),
      telegram: parseObject.get('telegram'),
    );
    // userProfileEntity.photoParseFileBase = kIsWeb
    //     ? parseObject.get('photo') as ParseWebFile
    //     : parseObject.get('photo') as ParseFile;
    return userProfileEntity;
  }

  Future<ParseObject> toParse() async {
    final profileParse = ParseObject('Profile');
    if (id != null) profileParse.objectId = id;
    profileParse.set('fullName', fullName);
    profileParse.set('nameTag', nameTag);
    profileParse.set('description', description);
    profileParse.set('isWoman', isWoman);
    if (photoParseFileBase != null) {
      profileParse.set('photo', photoParseFileBase);
    }
    profileParse.set('discord', discord);
    profileParse.set('telegram', telegram);
    return profileParse;
  }

  static Future<ParseFileBase> xFile2ParseFile(XFile xfile) async {
    String fileName = xfile.name;
    fileName = fileName.replaceAll(RegExp(r'[^A-Za-z0-9]'), '_');
    ParseFileBase? parseFile;
    print('===> fileName: $fileName');
    if (kIsWeb) {
      //Flutter Web
      parseFile = ParseWebFile(await xfile.readAsBytes(),
          name: fileName); //Name for file is required
    } else {
      //Flutter Mobile/Desktop
      parseFile = ParseFile(File(xfile.path), name: fileName);
    }
    await parseFile.save();
    return kIsWeb ? parseFile as ParseWebFile : parseFile as ParseFile;
  }

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, fullname: $fullName, nameTag: $nameTag, isWoman: $isWoman, photo: $photo, discord: $discord, telegram: $telegram, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileEntity &&
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
