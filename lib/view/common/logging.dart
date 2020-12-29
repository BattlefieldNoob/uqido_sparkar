import 'package:flutter/foundation.dart';

void printOnlyDebug(Object message) {
  if (kReleaseMode) return;
  print(message);
}
