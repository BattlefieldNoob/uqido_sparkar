import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.actions.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';

class LoginPage extends StatelessWidget {
  static const String PublicKey = """-----BEGIN PUBLIC KEY-----
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALKsB0abzSKq73XAeDj6Y6X1T93lddvI
BbWXekxzuZqxHmt/YECtUAodpn7EbRR8jzEnDyVQvqw+/q59gv4dOBkCAwEAAQ==
-----END PUBLIC KEY-----""";

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Spark AR',
      logo: 'assets/images/Icon-512.png',
      onLogin: (data) async => await _authUser(data, context),
      onSubmitAnimationCompleted: () {
        context.read<SparkARBloc>();
      },
      onRecoverPassword: (String a) => Future.value(null),
      onSignup: (LoginData r) => Future.value(null),
      //showDebugButtons: true,
      messages: LoginMessages(
        usernameHint: 'Username',
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
    final parser = RSAKeyParser();
    final publicKey = parser.parse(PublicKey) as RSAPublicKey;

    final encrypter =
        Encrypter(RSA(publicKey: publicKey, encoding: RSAEncoding.PKCS1));

    final encryptedEmail = encrypter.encrypt(data.name).base64;
    final encryptedPass = encrypter.encrypt(data.password).base64;

    print('Email: $encryptedEmail, Password: $encryptedPass');
    context.read<SparkARBloc>().add(
        SparkARAction.login(email: encryptedEmail, password: encryptedPass));

    await Future.delayed(Duration(seconds: 4));

    return context.read<SparkARBloc>().state.maybeMap(
        orElse: () => null, logout: (state) => "Email or Password are wrong!");
  }
}
