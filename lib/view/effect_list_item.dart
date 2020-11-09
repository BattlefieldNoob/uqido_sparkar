import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:url_launcher/url_launcher.dart';

class EffectListItem extends StatelessWidget {
  final SparkAREffect effect;

  const EffectListItem({Key key, this.effect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getCardScaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
              alignment: Alignment.centerLeft,
              child: Image.network(
                effect.iconUrl,
                width: 64,
                height: 64,
              )),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    effect.name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
          FittedBox(
              alignment: Alignment.centerRight,
              child: Row(children: [
                getClickableIcon(Icons.public_rounded, effect.publicLink),
                getClickableIcon(Icons.home, effect.testLink),
              ])),
        ],
      ),
    );
  }

  Widget getClickableIcon(IconData icon, String url) {
    return IconButton(
        iconSize: 48,
        icon: Icon(icon),
        color: Colors.white70,
        onPressed: () => launch(url));
  }

  Widget getCardScaffold({Widget child}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 106, .9)),
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 80, minWidth:double.infinity),
                child: AspectRatio(
                    aspectRatio: 7,
                    child:
                        Padding(padding: EdgeInsets.all(8), child: child)))));
  }
}
