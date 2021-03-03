import 'package:freezed_annotation/freezed_annotation.dart';

part 'sparkar_bloc.actions.freezed.dart';

@freezed
class SparkARAction with _$SparkARAction {
  const factory SparkARAction.update() = _UpdateAction;
  const factory SparkARAction.selectUser(int selectedUser) = _SelectAction;
  const factory SparkARAction.search(String keyword) = _SearchAction;
}
