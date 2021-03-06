import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/splash_routers.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/shared/bindings/apliccation_bindings.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApliccationBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Vakinha App',
      theme: VakinhaUi.theme,
      getPages: [
        ...HomeRouters.routers,
        ...SplashRouters.routers,
        ...AuthRouters.routers,
      ],
    );
  }
}
