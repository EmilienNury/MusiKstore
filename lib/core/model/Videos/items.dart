import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Videos/itemsId.dart';

part 'items.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Items{
  ItemsId id;

  Items({required this.id});

  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}