part of 'spark_ar_custom_tab_bar.dart';

Tab userToTab(Owner user) {
  return Tab(
    icon: CircleAvatar(
        backgroundImage: NetworkImage(
      user.profilePicture.uri,
    )),
    text: user.displayName,
  );
}
