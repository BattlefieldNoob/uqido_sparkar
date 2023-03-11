import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_data_model/sparkar_repository.dart';
import 'package:sparkar_netlify_datasource/netlify_function_db.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';

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

    if (repo is SparkARDataSource) {
      return FutureBuilder(
          future: getData(repo as SparkARDataSource),
          builder: (context, snapshot) => Text("HELLO!"));
    } else {
      return Container();
    }
  }

  Future<void> getData(SparkARDataSource db) async {
    // final encryptedData =
    //     await getEncryptedPasswordAndLoginData("b]an<A5}]2wX[PM=");
//
    // print(encryptedData.encpass);
    // print(encryptedData.lsd);
//
//
//
//
    // final result = await db.getData();
    //     //email: "antonio.ruggiero93@hotmail.it", loginData: encryptedData);
//
    // print(result);
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
