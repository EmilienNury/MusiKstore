// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Playlist',
      json,
      ($checkedConvert) {
        final val = Playlist(
          songs: $checkedConvert(
              'songs',
              (v) => (v as List<dynamic>)
                  .map((e) => Song.fromJson(e as Map<String, dynamic>))
                  .toList()),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'songs': instance.songs.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };
