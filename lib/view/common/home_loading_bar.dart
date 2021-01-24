import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';

class HomeLoadingBar extends PreferredSize {
  @override
  Size get preferredSize => const Size(double.infinity, 2.0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SparkARBloc, SparkARState>(builder: (ctx, state) {
      final opacity = state.maybeWhen(orElse: () => 0, loading: () => 1);

      return AnimatedOpacity(
          opacity: opacity.toDouble(),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutQuint,
          child: LinearProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(
                const Color.fromRGBO(78, 86, 196, 1.0)),
          ));
    });
  }
}
