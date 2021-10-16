import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.actions.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Spark AR',
      logo: 'assets/images/Icon-512.png',
      onLogin: (data) async => await _authUser(data, context),
      onSubmitAnimationCompleted: () {
        //context.read<SparkARBloc>();
      },
      onRecoverPassword: (String a) => Future.value(null),
      onSignup: (LoginData r) => Future.value(null),
      //showDebugButtons: true,
      messages: LoginMessages(
        userHint: 'Username',
        passwordHint: 'Pass',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot huh?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
    );
  }

  Future<String?> _authUser(LoginData data, BuildContext context) async {
    var encryptedData = await getEncryptedPasswordAndLoginData(data.password);

    //context
    //    .read<SparkARBloc>()
    //    .add(SparkARAction.login(email: data.name, loginData: encryptedData));

    await Future.delayed(Duration(seconds: 6));

    //return context.read<SparkARBloc>().state.maybeMap(
    //    orElse: () => null, logout: (state) => "Email or Password are wrong!");
  }
}
