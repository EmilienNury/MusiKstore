import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Songs/song.dart';

part 'feed.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Feed{
  List<Song>? results;

  Feed({this.results});

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}