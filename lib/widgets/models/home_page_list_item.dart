import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data_model/effect.dart';
import 'package:data_model/owner.dart';

part 'home_page_list_item.freezed.dart';

@freezed
abstract class HomePageListItem implements _$HomePageListItem {
  factory HomePageListItem.header(Owner owner) = _Header;
  factory HomePageListItem.effect(Effect effect, Owner owner) = _Effect;
}
