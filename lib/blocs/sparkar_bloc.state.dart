import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

part 'sparkar_bloc.state.freezed.dart';

@freezed
abstract class SparkARState implements _$SparkARState {
  const SparkARState._();

  List<SparkARUser> get userList =>
      networkUserList == filteredUserList ? networkUserList : filteredUserList;

  factory SparkARState(
      List<SparkARUser> networkUserList,
      List<SparkARUser> filteredUserList,
      int selected,
      bool isLoading,
      String searchKey) = _SparkARState;

  static SparkARState initial() {
    return SparkARState(List.empty(), List.empty(), -1, false, "");
  }
}
