import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:uqido_sparkar/db/mock/mock_db.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/view/common/app_breakpoints.dart';
import 'package:uqido_sparkar/view/common/app_theme.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_home_page.dart';

import 'blocs/sparkar_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
          builder: OneContext().builder,
          theme: getTheme(),
          home: const MobileHomePage())));
}

//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  runApp(ProviderScope(
//      observers: [Logger()],
//      child: MaterialApp(theme: getTheme(), home: const Example())));
//}

class Example extends ConsumerWidget {
  const Example();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        child: Column(children: [
      IconButton(
          onPressed: () =>
              ref.read(sparkARDataProvider.notifier).updateSparkARData(),
          icon: Icon(Icons.add)),
      const Counter()
    ]));
  }
}

class Counter extends ConsumerWidget {
  const Counter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sparkARDataProvider);
    return SizedBox.square(
        dimension: 200,
        child: ListView.builder(
          itemBuilder: (context, i) => ProviderScope(overrides: [
            currentUserId.overrideWithValue(state[i].id),
            currentEffect.overrideWithValue(state[i].effects[0])
          ], child: const MyText()),
          itemCount: state.length,
        ));
  }
}

class MyText extends ConsumerWidget {
  const MyText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effect = ref.watch(currentEffect);
    final userId = ref.read(currentUserId);
    return GestureDetector(
        onTap: () => ref
            .read(sparkARDataProvider.notifier)
            .toggleFavorite(userId, effect.id),
        child: Text("${effect.name} ${effect.isPreferite}"));
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
