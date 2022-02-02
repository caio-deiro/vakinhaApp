import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/appbar_widget.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/button_widget.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/text_field_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF140E0E),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/lanche.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 72),
                  ButtonWidget(
                    onPressed: () {
                      Get.toNamed('/auth/login');
                    },
                    text: 'ACESSAR',
                    width: MediaQuery.of(context).size.width * .60,
                    height: 35,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
