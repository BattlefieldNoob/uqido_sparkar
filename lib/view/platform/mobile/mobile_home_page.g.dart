// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_home_page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MobileHomePageTabController extends StatelessWidget {
  const MobileHomePageTabController(this.users, this.selected, {Key? key})
      : super(key: key);

  final List<SparkARUser> users;

  final int selected;

  @override
  Widget build(BuildContext _context) =>
      mobileHomePageTabController(_context, users, selected);
}

class MobileHomePageAppBar extends StatelessWidget {
  const MobileHomePageAppBar(this.users, {Key? key}) : super(key: key);

  final List<SparkARUser> users;

  @override
  Widget build(BuildContext _context) => mobileHomePageAppBar(_context, users);
}

class MobileHomePageBody extends StatelessWidget {
  const MobileHomePageBody(this.users, this.selected, {Key? key})
      : super(key: key);

  final List<SparkARUser> users;

  final int selected;

  @override
  Widget build(BuildContext _context) =>
      mobileHomePageBody(_context, users, selected);
}
