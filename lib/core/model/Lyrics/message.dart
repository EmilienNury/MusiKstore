import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Lyrics/body.dart';

part 'message.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Message{
  Body body;

  Message({required this.body});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}