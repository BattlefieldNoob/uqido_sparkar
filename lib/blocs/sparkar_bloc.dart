import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

enum SparkAREvent { update, selectUser }

abstract class SparkARAction {
  final SparkAREvent event;

  SparkARAction(this.event);
}

class SparkARUpdateAction extends SparkARAction {
  SparkARUpdateAction() : super(SparkAREvent.update);
}

class SparkARSelectUserAction extends SparkARAction {
  final int selectUserIndex;

  SparkARSelectUserAction(this.selectUserIndex)
      : super(SparkAREvent.selectUser);
}

class SparkARState {
  final List<SparkARUser> userList;
  final int selectedIndex;

  SparkARState._internal(this.userList, this.selectedIndex);

  SparkARState fromCurrent({List<SparkARUser> userList, int selectedIndex}) {
    return SparkARState._internal(
        userList ?? this.userList, selectedIndex ?? this.selectedIndex);
  }

  static SparkARState initial() {
    return SparkARState._internal(List.empty(), -1);
  }
}

class SparkARBloc extends Bloc<SparkARAction, SparkARState> {
  SparkARBloc() : super(SparkARState.initial());

  FirestoreDB _db = FirestoreDB.getInstance();

  @override
  Stream<SparkARState> mapEventToState(SparkARAction action) async* {
    print("Executing Event $action");
    switch (action.event) {
      case SparkAREvent.update:
        var users = await _db.getAllUsers();
        if(users.length==0)
          yield state;
        else
          yield state.fromCurrent(userList: users,selectedIndex: 0);
        break;
      case SparkAREvent.selectUser:
        var selectUserAction = action as SparkARSelectUserAction;
        if (selectUserAction.selectUserIndex < 0 ||
            selectUserAction.selectUserIndex > state.userList.length)
          yield state.fromCurrent(selectedIndex: -1);
        else
          yield state.fromCurrent(
              selectedIndex: selectUserAction.selectUserIndex);
        break;
      default:
        throw UnimplementedError();
        break;
    }
  }
}
