import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'circle_image.dart';

class AccountTab extends ConsumerWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUser);
    return Tab(
      icon: CircleImage(user.iconUrl),
      text: user.name,
    );
  }
}
