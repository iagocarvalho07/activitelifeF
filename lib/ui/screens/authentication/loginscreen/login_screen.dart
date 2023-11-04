import 'package:activitelifef/data/expections/firebase_auth_execption.dart';
import 'package:activitelifef/ui/widgets/auth_login_form.dart';
import 'package:activitelifef/utilits/assets_constants.dart';
import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/models/auth_form_data.dart';
import '../../../../data/repositorys/respostiroty_abstract.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _handleSubmit(AuthFormData formData) async {
    if (formData.islogin) {
      final statusLogin = await RepositoryAuthenticatonWithFireBase()
          .LoginWithEmailAndPassword(formData.email, formData.password);
      if (statusLogin == AuthResultStatus.successful) {
        Navigator.of(context).pushNamed(AppRoute.ScaffoldScreen);
      } else {
        final errorMsgL =
            AuthExceptionHandler.generateExceptionMessage(statusLogin);
        if (errorMsgL != null) {
          return buildAlertDialog(context, errorMsgL);
        }
      }
    } else {
      final status = await RepositoryAuthenticatonWithFireBase()
          .CreatUserWithEmailAndPassword(
              formData.name, formData.email, formData.password);
      if (status == AuthResultStatus.successful) {
        Navigator.of(context).pushNamed(AppRoute.ScaffoldScreen);
      } else {
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        buildAlertDialog(context, errorMsg);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                AssetsPath.imageBackGroudAppLoginScreen,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      "Active Life",
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 48),
                    ),
                  ),
                  AuthLoginForm(
                    onSubmit: _handleSubmit,
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

Future buildAlertDialog(BuildContext context, String msg) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AssetsPath.AlertDialogImage,
                height: 100,
              ),
            ),
          ],
        ),
        content: Text(msg),
      ),
    );
