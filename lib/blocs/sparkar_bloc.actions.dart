import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

part 'sparkar_bloc.actions.freezed.dart';

@freezed
class SparkARAction with _$SparkARAction {
  const factory SparkARAction.update() = _UpdateAction;

  const factory SparkARAction.selectUser(int selectedUser) = _SelectAction;

  const factory SparkARAction.search(String keyword) = _SearchAction;

  const factory SparkARAction.login(
      {String? email, EncryptedLoginData? loginData}) = _LoginAction;

  const factory SparkARAction.setPreferred(SparkAREffect effect, bool preferred) =
      _SetPreferredAction;
}
