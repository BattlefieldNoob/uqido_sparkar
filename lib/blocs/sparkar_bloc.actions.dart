part of 'sparkar_bloc.dart';

enum SparkAREvent { update, selectUser, search }

abstract class SparkARAction {
  final SparkAREvent event;

  const SparkARAction(this.event);
}

class SparkARUpdateAction extends SparkARAction {
  const SparkARUpdateAction() : super(SparkAREvent.update);
}

class SparkARSelectUserAction extends SparkARAction {
  final int selectUserIndex;

  SparkARSelectUserAction(this.selectUserIndex)
      : super(SparkAREvent.selectUser);
}

class SparkARSearchAction extends SparkARAction {
  final String searchKeyword;

  SparkARSearchAction(this.searchKeyword) : super(SparkAREvent.search);
}
