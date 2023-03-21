import 'package:flutter/material.dart';
import 'package:data_model/owner.dart';

class OwnerListItem extends StatelessWidget {
  final Owner owner;

  const OwnerListItem(this.owner, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(24, 64, 24, 8),
        child: Row(
          children: [
            SizedBox.square(
              child: Image.network(owner.profilePicture.uri),
              dimension: 48,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(owner.displayName, style: TextStyle(fontSize: 25.0))
          ],
        ));
  }
}
