import 'package:aluno/app/presentation/controllers/auth/email/auth_register_email_dependencies.dart';
import 'package:aluno/app/presentation/controllers/auth/login/login_dependencies.dart';
import 'package:aluno/app/presentation/controllers/auth/splash/splash_dependencies.dart';
import 'package:aluno/app/presentation/controllers/home/home_dependencies.dart';
import 'package:aluno/app/presentation/views/auth/login/auth_login_page.dart';
import 'package:aluno/app/presentation/views/auth/register/email/auth_register_email.page.dart';
import 'package:aluno/app/presentation/views/auth/splash/splash_page.dart';
import 'package:aluno/app/presentation/views/home/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const splash = '/';

  static const authLogin = '/auth/login';
  static const authRegisterEmail = '/auth/register/email';

  static const home = '/home';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: SplashDependencies(),
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.authLogin,
      binding: AuthLoginDependencies(),
      page: () => AuthLoginPage(),
    ),
    GetPage(
      name: Routes.authRegisterEmail,
      binding: AuthRegisterEmailDependencies(),
      page: () => AuthRegisterEmailPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeDependencies(),
      page: () => HomePage(),
    ),
  ];
}