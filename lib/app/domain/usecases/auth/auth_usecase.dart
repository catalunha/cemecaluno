import 'package:aluno/app/domain/entity/user_entity.dart';

abstract class AuthUseCase {
  Future<UserModel?> registerEmail(
      {required String email, required String phone, required String password});
  Future<UserModel?> loginEmail(
      {required String email, required String password});
  Future<void> forgotPassword(String email);

  Future<bool> logout();
}
