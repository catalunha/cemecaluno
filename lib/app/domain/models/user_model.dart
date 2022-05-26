import 'dart:convert';

import 'package:aluno/app/domain/models/user_profile_model.dart';

class UserModel {
  static const String className = '_User';

  final String id;
  final String email;
  final String phone;
  UserProfileModel? profile;
  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    this.profile,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    UserProfileModel? profile,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'profile': profile?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profile: UserProfileModel?.fromMap(map['profile']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(id: $id, email: $email, phone: $phone, profile: $profile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ phone.hashCode;
}
