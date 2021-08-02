
part of 'spark_ar_custom_tab_bar.dart';

Tab userToTab(SparkARUser user) {
  return Tab(
    icon: Image.network(
      user.iconUrl,
      width: 42,
      height: 42,
    ),
    text: user.name,
  );
}