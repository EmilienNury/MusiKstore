// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Song',
      json,
      ($checkedConvert) {
        final val = Song(
          id: $checkedConvert('id', (v) => v as String),
          artistName: $checkedConvert('artistName', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          artowrkUrl100: $checkedConvert('artowrkUrl100', (v) => v as String?),
          genres: $checkedConvert(
              'genres',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'artistName': instance.artistName,
      'name': instance.name,
      'artowrkUrl100': instance.artowrkUrl100,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
    };
