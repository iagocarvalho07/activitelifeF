import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:activitelifef/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthLoginForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthLoginForm({super.key, required this.onSubmit});

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  final googleImage = 'lib/assets/imagens/icons8-google-48.png';
  final facebookImage = 'lib/assets/imagens/icons8-facebook-48.png';

  final _formKey = GlobalKey<FormState>();
  final _myFormControler = TextEditingController();
  final _authForData = AuthFormData();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myFormControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 32,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Please login with your information",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (_authForData.isSingUp)
                            TextFormField(
                              key: const ValueKey("Name"),
                              initialValue: _authForData.name,
                              onChanged: (name) => _authForData.name = name,
                              decoration:
                                  const InputDecoration(labelText: 'Nome'),
                              validator: (_name) {
                                final name = _name ?? '';
                                if (name.trim().length < 3) {
                                  return 'O nome deve possuir 3 ou mais caracteres';
                                }
                                return null;
                              },
                            ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'E-mail'),
                            initialValue: _authForData.email,
                            onChanged: (email) =>
                                _authForData.email = email.trim(),
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
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Senha'),
                            initialValue: _authForData.password,
                            onChanged: (password) =>
                                _authForData.password = password,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            validator: (_password) {
                              final password = _password ?? '';
                              if (password.isEmpty || password.length < 6) {
                                return 'A senha deve Possuir 6 ou + Caracteres';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoute.ForgotPasswordScreen);
                                  },
                                  child: const Text("Esqueci senha")),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context)
                                      .pushNamed(AppRoute.ForgotPasswordScreen);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[100],
                                  shape: const StadiumBorder(),
                                  shadowColor: Colors.black,
                                  minimumSize: const Size.fromHeight(60)),
                              child: Text(
                                _authForData.islogin ? "Login" : "Criar Conta",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          if (_authForData.islogin)
                            Column(
                              children: [
                                const Text("or Login with"),
                                Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          googleImage,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(facebookImage)),
                                  ],
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _authForData.toogleAuthMode();
                              });
                            },
                            child: Text(
                                _authForData.islogin ? "Criar Conta" : "Login"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
