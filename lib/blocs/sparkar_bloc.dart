import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/common/logging.dart';

part 'sparkar_bloc.actions.dart';

class SparkARBloc extends Bloc<SparkARAction, SparkARState> {
  SparkARBloc() : super(SparkARState.initial()) {
    add(SparkARUpdateAction());
  }

  final FirestoreDB _db = FirestoreDB.getInstance();

  @override
  Stream<SparkARState> mapEventToState(final SparkARAction action) async* {
    printOnlyDebug("Executing Event $action");
    switch (action.event) {
      case SparkAREvent.update:
        yield* handleUpdateEvent();
        break;
      case SparkAREvent.selectUser:
        yield* handleSelectUserEvent(action);
        break;
      case SparkAREvent.search:
        yield* handleSearchEvent(action);
        break;
      default:
        throw UnimplementedError();
        break;
    }
  }

  Stream<SparkARState> handleSearchEvent(final SparkARAction action) async* {
    var searchAction = action as SparkARSearchAction;

    if (searchAction.searchKeyword.isEmpty) {
      yield state.copyWith(searchKey: '');
    } else {
      if (state.searchKey == searchAction.searchKeyword) {
        return;
      }

      yield state.copyWith(isLoading: true);

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

      yield state.copyWith(
          selected: filteredList.length == 0 ? 0 : 0,
          filteredUserList: filteredList,
          searchKey: searchAction.searchKeyword);
    }
  }

  Stream<SparkARState> handleSelectUserEvent(
      final SparkARAction action) async* {
    var selectUserAction = action as SparkARSelectUserAction;

    if (selectUserAction.selectUserIndex < 0 ||
        selectUserAction.selectUserIndex > state.userList.length)
      yield state.copyWith(selected: -1);
    else
      yield state.copyWith(selected: selectUserAction.selectUserIndex);
  }

  Stream<SparkARState> handleUpdateEvent() async* {
    yield state.copyWith(isLoading: true);

    var users = await _db.getAllUsers();

    if (users.length == 0)
      yield state.copyWith(networkUserList: List.empty());
    else
      yield state.copyWith(networkUserList: users, selected: 0);
  }
}
