import 'package:one_context/one_context.dart';

extension Doubles on int{
  double get w => (OneContext().mediaQuery.size.width * this) / 100;
}