import 'package:uqido_sparkar/blocs/sparkar_bloc.actions.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';
import 'package:uqido_sparkar/view/common/logging.dart';

//class SparkARBloc extends Bloc<SparkARAction, SparkARState> {
//  final AbstractDB _db;
//
//  SparkARBloc(this._db) : super(SparkARState.loading()) {
//    add(SparkARAction.login());
//  }
//
//  Stream<SparkARState> handleLoginAction(
//      String? email, EncryptedLoginData? loginData) async* {
//    if (email == null && loginData == null) {
//      //login with cached data
//
//      List<SparkARUser>? users = [];
//
//      users = await _db.getAllUsers(); //try login with cached data
//      if (users != null) {
//        if (users.isNotEmpty) {
//          print(_db.toString() + " Runned successfully");
//        } else {
//          print(_db.toString() + " Returned no data");
//        }
//      } else {
//        print(_db.toString() + " Raised an error, could not retrieve data");
//      }
//
//      if (users == null || users.isEmpty)
//        yield SparkARState.logout();
//      else
//        yield SparkARState.valid(users, selected: 0);
//    } else if (email != null && loginData != null && email.isNotEmpty) {
//      //login with new credentials
//      List<SparkARUser>? users =
//          await _db.getAllUsers(email: email, loginData: loginData);
//      if (users != null) {
//        if (users.isNotEmpty) {
//          print(_db.toString() + " Runned successfully");
//        } else {
//          print(_db.toString() + " Returned no data");
//        }
//      } else {
//        print(_db.toString() + " Raised an error, could not retrieve data");
//      }
//
//      if (users == null || users.isEmpty)
//        yield SparkARState.logout();
//      else {
//        yield SparkARState.valid(users, selected: 0);
//      }
//    } else {
//      yield SparkARState.error();
//    }
//  }
//
//  Stream<SparkARState> handleSearchEvent(final String keyword) async* {
//    yield* state.maybeMap(orElse: () async* {
//      yield state;
//    }, valid: (validState) async* {
//      if (keyword.isEmpty) {
//        yield validState.copyWith(searchKey: '');
//      } else {
//        if (validState.searchKey == keyword) {
//          return;
//        }
//
//        yield SparkARState.loading();
//
//        var filteredList = await Future(() async {
//          final filteredList = List<SparkARUser>.empty(growable: true);
//          for (var user in validState.networkUserList) {
//            if (user.name.toLowerCase().contains(keyword.toLowerCase())) {
//              //take all user with effects
//              filteredList.add(user);
//            } else {
//              //filter effects by effects
//              final effects = user.effects
//                  .where((effect) =>
//                      effect.name.toLowerCase().contains(keyword.toLowerCase()))
//                  .toList(growable: false);
//              if (effects.length > 0)
//                filteredList.add(user.copyWith(effects: effects));
//            }
//          }
//          return filteredList;
//        });
//
//        yield validState.copyWith(
//            selected: 0, filteredUserList: filteredList, searchKey: keyword);
//      }
//    });
//  }
//
//  Stream<SparkARState> handleSelectUserEvent(final int selected) async* {
//    yield* state.maybeMap(orElse: () async* {
//      yield state;
//    }, valid: (validState) async* {
//      if (selected < 0 || selected > validState.userList.length)
//        yield validState.copyWith(selected: -1);
//      else
//        yield validState.copyWith(selected: selected);
//    });
//  }
//
//  Stream<SparkARState> handleUpdateEvent() async* {
//    yield SparkARState.loading();
//
//    List<SparkARUser>? users = [];
//    users = await _db.getAllUsers();
//    if (users != null) {
//      if (users.isNotEmpty) {
//        print(_db.toString() + " Runned successfully");
//      } else {
//        print(_db.toString() + " Returned no data");
//      }
//    } else {
//      print(_db.toString() + " Raised an error, could not retrieve data");
//    }
//
//    if (users == null || users.isEmpty)
//      yield SparkARState.valid(List.empty());
//    else
//      yield SparkARState.valid(users, selected: 0);
//  }
//}
