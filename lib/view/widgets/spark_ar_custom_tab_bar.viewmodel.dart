part of 'spark_ar_custom_tab_bar.dart';

Tab userToTab(SparkARUser user) {
  return Tab(
    icon: CircleAvatar(
        backgroundImage: NetworkImage(
      user.iconUrl,
    )),
    text: user.name,
  );
}
