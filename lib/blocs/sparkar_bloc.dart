import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/common/logging.dart';

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

class SparkARState {
  List<SparkARUser> get userList =>
      networkUserList == filteredUserList ? networkUserList : filteredUserList;

  final List<SparkARUser> networkUserList;
  final List<SparkARUser> filteredUserList;
  final int selectedIndex;
  final bool isLoading;
  final String searchKey;

  SparkARState._internal(this.networkUserList, this.selectedIndex,
      this.isLoading, this.filteredUserList, this.searchKey);

  SparkARState fromCurrent(
      {List<SparkARUser> networkUserList,
      int selectedIndex,
      bool isLoading = false,
      List<SparkARUser> filteredList,
      String searchKey}) {
    return SparkARState._internal(
        networkUserList ?? this.networkUserList,
        selectedIndex ?? this.selectedIndex,
        isLoading,
        filteredList ?? networkUserList ?? this.networkUserList,
        searchKey ?? this.searchKey);
  }

  @override
  String toString() {
    return 'SparkARState{networkUserList: $networkUserList, filteredUserList: $filteredUserList, selectedIndex: $selectedIndex, isLoading: $isLoading, searchKey: $searchKey}';
  }

  static SparkARState initial() {
    return SparkARState._internal(List.empty(), -1, false, List.empty(), "");
  }
}

class SparkARBloc extends Bloc<SparkARAction, SparkARState> {
  SparkARBloc() : super(SparkARState.initial()) {
    add(SparkARUpdateAction());
  }

  final FirestoreDB _db = FirestoreDB.getInstance();

  @override
  Stream<SparkARState> mapEventToState(SparkARAction action) async* {
    printOnlyDebug("Executing Event $action");
    switch (action.event) {
      case SparkAREvent.update:
        yield state.fromCurrent(isLoading: true);

        var users = await _db.getAllUsers();

        if (users.length == 0)
          yield state.fromCurrent(isLoading: false);
        else
          yield state.fromCurrent(networkUserList: users, selectedIndex: 0);
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

      case SparkAREvent.search:
        var searchAction = action as SparkARSearchAction;

        if (searchAction.searchKeyword.isEmpty) {
          yield state.fromCurrent(searchKey: '');
        } else {
          if (state.searchKey == searchAction.searchKeyword) {
            return;
          }

          yield state.fromCurrent(isLoading: true);

          var filteredList = await Future(() async {
            final filteredList = List<SparkARUser>.empty(growable: true);
            for (var user in state.networkUserList) {
              if (user.name
                  .toLowerCase()
                  .contains(searchAction.searchKeyword.toLowerCase())) {
                //take all user with effects
                filteredList.add(user);
              } else {
                //filter effects by effects
                final effects = user.effects
                    .where((effect) => effect.name
                        .toLowerCase()
                        .contains(searchAction.searchKeyword.toLowerCase()))
                    .toList(growable: false);
                if (effects.length > 0)
                  filteredList.add(user.cloneWithEffects(effects));
              }
            }
            return filteredList;
          });

          yield state.fromCurrent(
              selectedIndex: filteredList.length == 0 ? 0 : 0,
              filteredList: filteredList,
              searchKey: searchAction.searchKeyword);
        }
        break;
      default:
        throw UnimplementedError();
        break;
    }
  }
}
