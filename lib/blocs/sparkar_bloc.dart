import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.actions.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/common/logging.dart';

class SparkARBloc extends Bloc<SparkARAction, SparkARState> {
  final FirestoreDB _db;

  SparkARBloc(this._db) : super(SparkARState.loading()) {
    add(SparkARAction.update());
  }

  @override
  Stream<SparkARState> mapEventToState(final SparkARAction action) async* {
    printOnlyDebug("Executing Event $action");

    yield* action.when(
        update: () => handleUpdateEvent(),
        selectUser: (index) => handleSelectUserEvent(index),
        search: (keyword) => handleSearchEvent(keyword));
  }

  Stream<SparkARState> handleSearchEvent(final String keyword) async* {
    yield* state.maybeMap(orElse: () async* {
      yield state;
    }, valid: (validState) async* {
      if (keyword.isEmpty) {
        yield validState.copyWith(searchKey: '');
      } else {
        if (validState.searchKey == keyword) {
          return;
        }

        yield SparkARState.loading();

        var filteredList = await Future(() async {
          final filteredList = List<SparkARUser>.empty(growable: true);
          for (var user in validState.networkUserList) {
            if (user.name.toLowerCase().contains(keyword.toLowerCase())) {
              //take all user with effects
              filteredList.add(user);
            } else {
              //filter effects by effects
              final effects = user.effects
                  .where((effect) =>
                      effect.name.toLowerCase().contains(keyword.toLowerCase()))
                  .toList(growable: false);
              if (effects.length > 0)
                filteredList.add(user.cloneWithEffects(effects));
            }
          }
          return filteredList;
        });

        yield validState.copyWith(
            selected: validState.selected.clamp(0, filteredList.length - 1),
            filteredUserList: filteredList,
            searchKey: keyword);
      }
    });
  }

  Stream<SparkARState> handleSelectUserEvent(final int selected) async* {
    yield* state.maybeMap(orElse: () async* {
      yield state;
    }, valid: (validState) async* {
      if (selected < 0 || selected > validState.userList.length)
        yield validState.copyWith(selected: -1);
      else
        yield validState.copyWith(selected: selected);
    });
  }

  Stream<SparkARState> handleUpdateEvent() async* {
    yield SparkARState.loading();

    try {
      var users = await _db.getAllUsers();

      if (users.length == 0)
        yield SparkARState.valid(List.empty());
      else
        yield SparkARState.valid(users, selected: 0);
    } catch (_) {
      yield SparkARState.error();
    }
  }
}
