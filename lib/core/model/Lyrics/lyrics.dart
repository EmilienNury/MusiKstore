import 'package:json_annotation/json_annotation.dart';

part 'lyrics.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Lyrics{
  int lyrics_id;
  String? lyrics_body;
  String? pixel_tracking_url;

  Lyrics({ required this.lyrics_id,this.lyrics_body,this.pixel_tracking_url});

  factory Lyrics.fromJson(Map<String, dynamic> json) =>
      _$LyricsFromJson(json);

  Map<String, dynamic> toJson() => _$LyricsToJson(this);


}