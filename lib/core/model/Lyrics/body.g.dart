// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Body _$BodyFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Body',
      json,
      ($checkedConvert) {
        final val = Body(
          lyrics: $checkedConvert(
              'lyrics', (v) => Lyrics.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{
      'lyrics': instance.lyrics.toJson(),
    };
