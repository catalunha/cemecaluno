import 'dart:convert';

class UserModel {
  static const String className = '_User';

  final String id;
  final String email;
  final String phone;
  UserModel({
    required this.id,
    required this.email,
    required this.phone,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(id: $id, email: $email, phone: $phone)';

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
