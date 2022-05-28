import 'package:aluno/app/presentation/controllers/auth/email/auth_register_email_dependencies.dart';
import 'package:aluno/app/presentation/controllers/auth/login/login_dependencies.dart';
import 'package:aluno/app/presentation/controllers/auth/splash/splash_dependencies.dart';
import 'package:aluno/app/presentation/controllers/home/course/offer/course_offer_dependencies.dart';
import 'package:aluno/app/presentation/controllers/home/home_dependencies.dart';
import 'package:aluno/app/presentation/controllers/student/course/student_course_dependencies.dart';
import 'package:aluno/app/presentation/controllers/user/profile/user_profile_dependencies.dart';
import 'package:aluno/app/presentation/views/auth/login/auth_login_page.dart';
import 'package:aluno/app/presentation/views/auth/register/email/auth_register_email.page.dart';
import 'package:aluno/app/presentation/views/auth/splash/splash_page.dart';
import 'package:aluno/app/presentation/views/home/home_page.dart';
import 'package:aluno/app/presentation/views/student/cart/purchase_cart.dart';
import 'package:aluno/app/presentation/views/student/course/current/course_page.dart';
import 'package:aluno/app/presentation/views/student/order/purchase_order.dart';
import 'package:aluno/app/presentation/views/user/profile/user_profile_page.dart';
import 'package:get/get.dart';

class Routes {
  static const splash = '/';

  static const authLogin = '/auth/login';
  static const authRegisterEmail = '/auth/register/email';

  static const home = '/home';
  static const userProfile = '/user/profile';

  static const purchaseCart = '/purchase/cart';
  static const purchaseOrder = '/purchase/order';

  static const course = '/course';

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
      bindings: [
        HomeDependencies(),
        StudentCourseDependencies(),
        CourseOfferDependencies()
      ],
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.purchaseCart,
      // binding: HomeDependencies(),
      page: () => PurchaseCart(),
    ),
    GetPage(
      name: Routes.purchaseOrder,
      // binding: HomeDependencies(),
      page: () => const PurchaseOrder(),
    ),
    GetPage(
      name: Routes.course,
      bindings: [StudentCourseDependencies()],
      page: () => CoursePage(),
    ),
    GetPage(
      name: Routes.userProfile,
      binding: UserProfileDependencies(),
      page: () => UserProfilePage(),
    ),
  ];
}
