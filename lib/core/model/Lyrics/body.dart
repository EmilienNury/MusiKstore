import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Lyrics/lyrics.dart';

part 'body.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Body{
  Lyrics lyrics;

  Body({ required this.lyrics});

  factory Body.fromJson(Map<String, dynamic> json) =>
      _$BodyFromJson(json);

  Map<String, dynamic> toJson() => _$BodyToJson(this);
}