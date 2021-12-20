import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_providers/spark_ar_data_provider.dart';
import 'package:sparkar_repository/netlify_function_db.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(observers: [
    Logger()
  ], overrides: [
    repositoryProvider.overrideWithValue(NetlifyFunctionDB.getInstance())
  ], child: MaterialApp(home: Example())));
}

class Example extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(repositoryProvider);

    return FutureBuilder(
        future: getData(repo), builder: (context, snapshot) => Text("HELLO!"));
  }

  Future<void> getData(AbstractRepository db) async {
    final encryptedData =
        await getEncryptedPasswordAndLoginData("b]an<A5}]2wX[PM=");

    print(encryptedData.encpass);
    print(encryptedData.lsd);

    final result = await db.getUsersAndEffectsData(
        email: "antonio.ruggiero93@hotmail.it", loginData: encryptedData);

    print(result);
  }
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}
