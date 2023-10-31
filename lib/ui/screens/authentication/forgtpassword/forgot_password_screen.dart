
import 'package:activitelifef/utilits/assets_constants.dart';
import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String emailPas = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                AssetsPath.imageBackGroudAppLoginScreen,
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Digite seu Email, para Recuperação de senha",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration:
                                    const InputDecoration(labelText: 'E-mail'),
                                initialValue: emailPas,
                                onChanged: (email) => emailPas = email.trim(),
                                keyboardType: TextInputType.emailAddress,
                                validator: (_email) {
                                  final email = _email ?? '';
                                  if (email.trim().isEmpty ||
                                      !email.contains('@')) {
                                    return 'Informe um e-mail válido.';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        debugPrint(emailPas);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog.adaptive(
                                                  title: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SvgPicture.asset(
                                                          AssetsPath
                                                              .AlertDialogImage,
                                                          height: 100,
                                                        ),
                                                      ),
                                                      const Text(
                                                          "Email Enviado"),
                                                    ],
                                                  ),
                                                  content: const Text(
                                                      "Check your email adreess, and recover your password"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pushNamed(AppRoute
                                                                  .LoginScreen);
                                                        },
                                                        child: const Text("Ok"))
                                                  ],
                                                ));
                                      }
                                    },
                                    child: const Text("Recuperar Senha")),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
