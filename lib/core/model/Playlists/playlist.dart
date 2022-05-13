import 'package:json_annotation/json_annotation.dart';
import 'package:ptut_2/core/model/Songs/song.dart';

part 'playlist.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Playlist{
  List<Song> songs;
  String name;

  Playlist(
      { required this.songs,
        required this.name
      });

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}