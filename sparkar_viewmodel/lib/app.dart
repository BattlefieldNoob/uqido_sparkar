
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_providers/spark_ar_data_provider.dart';
import 'package:sparkar_viewmodel/common/login_page.dart';
import 'package:sparkar_viewmodel/home_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLoginState = ref.watch(authProvider);
    return asyncLoginState.when(data: (logged) {
      return logged ? const HomePage() : const LoginPage();
    },
        error: (o,stack,v) => const LoginPage(),
        loading: (v) => const Container());
  }
}