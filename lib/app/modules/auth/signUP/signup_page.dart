import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/appbar_widget.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/button_widget.dart';
import 'package:vakinha_burguer_mobile/app/shared/UI/widgets/text_field_widget.dart';
import 'package:validatorless/validatorless.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool validate() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
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
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastro',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Preencha os campos abaixo para criar o seu cadastro.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        controller: _nameEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo Obrigatório'),
                        ]),
                        label: 'Nome'),
                    SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.email('Email inválido'),
                          Validatorless.required('Campo Obrigatório'),
                        ]),
                        label: 'E-mail'),
                    SizedBox(
                      height: 30,
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
                      height: 30,
                    ),
                    TextFieldWidget(
                      controller: _confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.compare(
                            _passwordEC, 'Senhas não são iguais'),
                        Validatorless.min(6, 'Minimo de 6 caracteres'),
                        Validatorless.required('Campo Obrigatório'),
                      ]),
                      label: 'Confirmar Senha',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ButtonWidget(
                        onPressed: () {
                          if (validate()) {
                            //!Chamar API para cadastrar
                          }
                        },
                        text: 'CADASTRAR',
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 148,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
