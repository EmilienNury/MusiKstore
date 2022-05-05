import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Songs/genre.dart';

part 'song.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Song{
  String id;
  String? artistName;
  String? name;
  String? artworkUrl100;
  List<Genre>? genres;

  Song({required this.id, this.artistName, this.name, this.artworkUrl100, this.genres});

  factory Song.fromJson(Map<String, dynamic> json) =>
      _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);

}