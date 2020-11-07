import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SparkARBloc(),
      child: MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              appBar: AppBar(title: const Text('Uqido Spark AR')),
              body: HomePage())),
    );
  }
}
