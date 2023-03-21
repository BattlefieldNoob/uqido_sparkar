import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage() : super(key: null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterLogin(
      title: 'Spark AR',
      logo: 'assets/images/Icon-512.png',
      onLogin: (data) async => await _authUser(data, context, ref),
      onSubmitAnimationCompleted: () {
        //context.read<SparkARBloc>();
      },
      onRecoverPassword: (String a) => Future.value(null),
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

  Future<String?> _authUser(
      LoginData data, BuildContext context, WidgetRef ref) async {
    return null;
    //final db = ref.read(repositoryProvider);
//
    //if (db is AuthRepository) {
    //  final dataSource = db as AuthRepository;
    //  if (await dataSource.isLogged()) {
    //    await dataSource.logout();
    //  }
    //  if (await dataSource.login(NetlifyLoginData(data.name, data.password))) {
    //    ref.refresh(authProvider);
    //    return null;
    //  } else {
    //    return "Wrong username or password!";
    //  }
    //} else {
    //  return "Something wrong! Please reload page";
    //}
  }
}
