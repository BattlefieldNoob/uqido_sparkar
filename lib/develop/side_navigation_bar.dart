import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideNavigationBarThin extends StatelessWidget {
  const SideNavigationBarThin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Container(
        color: Color.fromRGBO(28, 28, 32, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SideNavigationBarHeader(),
              Separator(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              Separator(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              Spacer(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              Separator(),
              SideNavigationBarUserAccount()
            ],
          ),
        ),
      ),
    );
  }
}

class SideNavigationBarExpanded extends StatelessWidget {
  const SideNavigationBarExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        color: Color.fromRGBO(28, 28, 32, 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SideNavigationBarHeader(),
              Separator(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              Separator(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              Spacer(),
              SideNavigationBarIcon(),
              SideNavigationBarIcon(),
              Separator(),
              SideNavigationBarUserAccount()
            ],
          ),
        ),
      ),
    );
  }
}

class SideNavigationBarHeader extends StatelessWidget {
  const SideNavigationBarHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 100) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            "assets/images/Icon-512.png",
            height: 28,
            width: 28,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Image.asset(
                "assets/images/Icon-512.png",
                height: 28,
                width: 28,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Uqido SparkAR",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      }
    });
  }
}

class SideNavigationBarIcon extends StatelessWidget {
  const SideNavigationBarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 100) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            "assets/images/Icon-512.png",
            height: 28,
            width: 28,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Image.asset(
                "assets/images/Icon-512.png",
                height: 28,
                width: 28,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Uqido SparkAR",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
        );
      }
    });
  }
}

class SideNavigationBarUserAccount extends StatelessWidget {
  const SideNavigationBarUserAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 100) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            "assets/images/Icon-512.png",
            height: 28,
            width: 28,
          ),
        );
      } else {
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              "assets/images/Icon-512.png",
              height: 28,
              width: 28,
            ),
          ),
          title: Text(
            "Uqido SparkAR",
            style: TextStyle(fontSize: 14),
          ),
          subtitle: Text(
            "Uqido SparkAR",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        );
      }
    });
  }
}

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 2,
        child: Container(
          color: Colors.white12,
        ),
      ),
    );
  }
}
