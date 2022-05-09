import 'package:json_annotation/json_annotation.dart';

part 'itemsId.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class ItemsId{
  String videoId;

  ItemsId({required this.videoId});

  factory ItemsId.fromJson(Map<String, dynamic> json) =>
      _$ItemsIdFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsIdToJson(this);
}