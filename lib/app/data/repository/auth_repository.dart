import 'package:aluno/app/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserModel?> registerEmail(
      {required String email, required String phone, required String password});
  Future<UserModel?> loginEmail(
      {required String email, required String password});
  Future<bool> logout();
  Future<void> forgotPassword(String email);
}
