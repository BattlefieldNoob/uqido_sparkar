import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:url_launcher/url_launcher.dart';

class EffectListItem extends StatelessWidget {
  final SparkAREffect effect;

  const EffectListItem({Key key, this.effect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          elevateIntoCard(Image.network(effect.iconUrl, width: 64, height: 64)),
          Text(
            effect.name,
            style: TextStyle(fontSize: 30),
          ),
          Row(children: [
            elevateIntoCard(
                getClickableIcon(Icons.public_rounded, effect.publicLink)),
            elevateIntoCard(getClickableIcon(Icons.home, effect.testLink)),
          ]),
        ],
      ),
    ));
  }

  Widget elevateIntoCard(Widget child) {
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child);
  }

  Widget getClickableIcon(IconData icon, String url) {
    return IconButton(
        iconSize: 48,
        icon: Icon(icon),
        color: Colors.black12,
        onPressed: () => launch(url));
  }
}
