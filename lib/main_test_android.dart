// @dart=2.9
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Hello());

  /*var a = await getEncryptedPasswordAndLoginData("H9ZH6qhxW88i9Xf");

  print(a.encpass);
  print(a.lsd);*/

  var cookie =
      "datr=YTtqYBmMlK8yOsGhXEibkAQF; sb=ajtqYN1SWDaaWW37v3Fef1QU; c_user=1614964298; spin=r.1003566664_b.trunk_t.1617574763_s.1_v.2_; xs=3:gMHWjY7DLLcMyw:2:1617574762:11787:10452::AcVWusUuPwZe2xeEO7CRuYKbYKacnHQbjPPgCcXlTA; fr=10rsMhBKXlEz9Qn8F.AWUqT3fKK29rRDWKDrO6tZuxwgY.BgaxP0.2x.AAA.0.0.BgaxP0.AWUBBYKRbgc; wd=629x947";
  print(await getUsersAndEffectsByRequest(cookie, 'AQF40UU3lw-C:AQGX_lm9jc40'));
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Text("hello!"),
      ),
    );
  }
}
