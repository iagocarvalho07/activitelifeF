import 'package:activitelifef/utilits/assets_constants.dart';
import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/material.dart';
import '../../data/models/auth_form_data.dart';

class AuthLoginForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthLoginForm({super.key, required this.onSubmit});

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _myFormControler = TextEditingController();
  final _authForData = AuthFormData();
  bool isCheked = false;

  double opacityLevel = 0.0;
  double opacityLevelLogin = 1.0;

  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _slideAnimation;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
    setState(() => opacityLevelLogin = opacityLevelLogin == 0 ? 1.0 : 0.0);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myFormControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );
  }

  void _switchAuthMode() {
    setState(() {
      if (_authForData.islogin) {
        _controller?.forward();
      } else {
        _controller?.reverse();
      }
    });
  }

  void _submit(){
    final isvalid = _formKey.currentState?.validate() ?? false;
    if(!isvalid) return;
    widget.onSubmit(_authForData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          constraints: BoxConstraints(
                            minHeight: _authForData.islogin ? 0 : 60,
                            maxHeight: _authForData.islogin ? 0 : 120,
                          ),
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                          child: FadeTransition(
                            opacity: _opacityAnimation!,
                            child: SlideTransition(
                              position: _slideAnimation!,
                              child: AnimatedOpacity(
                                opacity: opacityLevel,
                                duration: const Duration(milliseconds: 1500),
                                child: _authForData.isSingUp ? TextFormField(
                                  key: const ValueKey("Name"),
                                  initialValue: _authForData.name,
                                  onChanged: (name) =>
                                      _authForData.name = name,
                                  decoration: const InputDecoration(
                                      labelText: 'Nome'),
                                  validator: (_name) {
                                    final name = _name ?? '';
                                    if (name.trim().length < 3) {
                                      return 'O nome deve possuir 3 ou mais caracteres';
                                    }
                                    if(_authForData.islogin){
                                      return null;
                                    }
                                    return null;
                                  },
                                ) : Text(""),
                              ),
                            ),
                          ),
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
                        if (_authForData.islogin)
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
                          AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            constraints: BoxConstraints(
                              minHeight: _authForData.islogin ? 0 : 60,
                              maxHeight: _authForData.islogin ? 0 : 100,
                            ),
                            child: AnimatedOpacity(
                              opacity: opacityLevel,
                              duration: const Duration(seconds: 2),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                          value: isCheked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isCheked = value!;
                                            });
                                          }),
                                      const Column(
                                        children: [
                                          Text(
                                              "Li e estou de acordo com os Termos de uso"),
                                        ],
                                      )
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(" Politica de privacidade"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ElevatedButton(
                          onPressed: _submit,
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
                        AnimatedContainer(
                          constraints: BoxConstraints(
                            minHeight: _authForData.islogin ? 60 : 0,
                            maxHeight: _authForData.islogin ? 90 : 0,
                          ),
                          duration: const Duration(seconds: 1),
                          child: AnimatedOpacity(
                            opacity: opacityLevelLogin,
                            duration: const Duration(milliseconds: 2000),
                            child: Column(
                              children: [
                                const Text("or Login with"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              AppRoute.ScaffoldScreen);
                                        },
                                        icon: Image.asset(
                                          AssetsPath.googleImage,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            AssetsPath.facebookImage)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            _switchAuthMode();
                            _changeOpacity();
                            setState(
                              () => _authForData.toogleAuthMode(),
                            );
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
    );
  }
}
