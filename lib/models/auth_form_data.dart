
enum AuthMode {SingUp, Login}

class AuthFormData{
  String name = '';
  String email = '';
  String password = '';
  AuthMode _mode = AuthMode.Login;

  bool get islogin {
    return _mode == AuthMode.Login;
  }

  bool get isSingUp {
    return _mode == AuthMode.SingUp;
  }

  void toogleAuthMode(){
    _mode = islogin ? AuthMode.SingUp : AuthMode.Login;
  }
}
