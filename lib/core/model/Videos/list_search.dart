import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Videos/items.dart';

part 'list_search.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class ListSearch{
  List<Items>? items;

  ListSearch({this.items});

  factory ListSearch.fromJson(Map<String, dynamic> json) =>
      _$ListSearchFromJson(json);

  Map<String, dynamic> toJson() => _$ListSearchToJson(this);
}