import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';

class HomeLoadingBar extends PreferredSize {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 1.0),
        child: BlocBuilder<SparkARBloc, SparkARState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            builder: (ctx, state) {
              return AnimatedOpacity(
                  opacity: state.isLoading ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutQuint,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        const Color.fromRGBO(78, 86, 196, 1.0)),
                  ));
            }));
  }
}
