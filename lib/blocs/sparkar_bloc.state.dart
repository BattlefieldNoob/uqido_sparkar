import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

part 'sparkar_bloc.state.freezed.dart';

@freezed
class SparkARState with _$SparkARState {
  factory SparkARState.valid(List<SparkARUser> networkUserList,
      {@Default([]) List<SparkARUser> filteredUserList,
      @Default(-1) int selected,
      @Default("") String searchKey}) = _SparkARValidState;

  factory SparkARState.loading() = _SparkARLoadingState;
  factory SparkARState.error() = _SparkARErrorState;
}

extension Properties on _SparkARValidState {
  List<SparkARUser> get userList =>
      searchKey.isEmpty ? networkUserList : filteredUserList;
}
