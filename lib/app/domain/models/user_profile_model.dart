import 'dart:convert';

class UserProfileModel {
  final String? id;
  final String? fullName;
  final String? nameTag;
  final String? description;
  final bool? isWoman;
  final String? photo;
  final String? phone;
  final String? discord;
  final String? telegram;

  String get nameTagIfNull => nameTag ?? 'Não informado.';
  String get phoneIfNull => phone ?? '00000000000';
  String get photoIfNull =>
      photo ??
      'https://parsefiles.back4app.com/ZuF4FI4dZUN4i9ObIoK6LvTuoIuVFNsVAMRjYNkX/fbeae4ba125a7417f7decb33570a6d3c_barcode.png';

  UserProfileModel({
    this.id,
    this.fullName,
    this.nameTag,
    this.description,
    this.isWoman,
    this.photo,
    this.phone,
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
    String? phone,
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
      phone: phone ?? this.phone,
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
      'phone': phone,
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
      phone: map['phone'],
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
        other.phone == phone &&
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
        phone.hashCode ^
        discord.hashCode ^
        telegram.hashCode;
  }
}
