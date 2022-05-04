import 'package:json_annotation/json_annotation.dart';

import 'feed.dart';

part 'songs.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Songs{
  Feed feed;

  Songs({required this.feed});

  factory Songs.fromJson(Map<String, dynamic> json) =>
      _$SongsFromJson(json);

  Map<String, dynamic> toJson() => _$SongsToJson(this);
}