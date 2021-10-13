import 'package:flutter/material.dart';
import 'circle_image.dart';

class AccountTab extends StatelessWidget {
  final name;
  final imageUrl;

  const AccountTab(this.name, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: CircleImage(imageUrl),
      text: name,
    );
  }
}
