import 'package:flutter/foundation.dart';

void printOnlyDebug(final Object message) {
  if (kReleaseMode) return;
  print(message);
}
