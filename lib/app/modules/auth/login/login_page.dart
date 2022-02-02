import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/login/login_controller.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/vakinha_state.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/appbar_widget.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/button_widget.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/text_field_widget.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _formkey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  bool validate() {
    final form = _formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFieldWidget(
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.email('Email inválido'),
                          Validatorless.required('Campo Obrigatório'),
                        ]),
                        label: 'E-mail'),
                    SizedBox(
                      height: 45,
                    ),
                    TextFieldWidget(
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.min(6, 'Minimo de 6 caracteres'),
                        Validatorless.required('Campo Obrigatório'),
                      ]),
                      label: 'Senha',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 74,
                    ),
                    Center(
                      child: ButtonWidget(
                        onPressed: () {
                          if (validate()) {
                            controller.login(
                                email: _emailEC.text,
                                password: _passwordEC.text);
                          }
                        },
                        text: 'ENTRAR',
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 148,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Não possui conta?'),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/auth/signUP');
                          },
                          child: Text('CADASTRE-SE'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
