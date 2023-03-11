import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/widgets/common/login_page.dart';
import 'package:uqido_sparkar/widgets/home_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLoginState = ref.watch(authProvider);
    return asyncLoginState.when(
        data: (logged) {
          return logged ? const HomePage() : const LoginPage();
        },
        error: (o, stack) => const LoginPage(),
        loading: () => const SizedBox());
  }
}
