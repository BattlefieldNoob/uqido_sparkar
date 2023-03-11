import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:widgets/circle_image.dart';

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

class PreferredAccountTab extends StatelessWidget {
  const PreferredAccountTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: CircleAvatar(
        backgroundImage: AssetImage("assets/images/starred.png"),
        radius: 22,
      ),
      text: "Preferred",
    );
  }
}
