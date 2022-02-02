import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/login/login_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/signUP/signup_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/signUP/signup_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      binding: LoginBindings(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/auth/signUP',
      binding: SignupBindings(),
      page: () => SignupPage(),
    ),
  ];
}
