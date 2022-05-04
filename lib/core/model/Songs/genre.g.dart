// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Genre',
      json,
      ($checkedConvert) {
        final val = Genre(
          genreId: $checkedConvert('genreId', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'genreId': instance.genreId,
      'name': instance.name,
    };
