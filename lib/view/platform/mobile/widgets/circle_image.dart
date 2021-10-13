import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final url;

  const CircleImage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundImage: NetworkImage(url),radius: 22,);
  }
}
