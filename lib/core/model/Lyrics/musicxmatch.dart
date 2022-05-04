import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Lyrics/message.dart';

part 'musicxmatch.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Musicxmatch{
  Message message;

  Musicxmatch({required this.message});

  factory Musicxmatch.fromJson(Map<String, dynamic> json) =>
      _$MusicxmatchFromJson(json);

  Map<String, dynamic> toJson() => _$MusicxmatchToJson(this);
}