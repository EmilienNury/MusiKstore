// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lyrics _$LyricsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Lyrics',
      json,
      ($checkedConvert) {
        final val = Lyrics(
          lyrics_id: $checkedConvert('lyrics_id', (v) => v as int),
          lyrics_body: $checkedConvert('lyrics_body', (v) => v as String?),
          pixel_tracking_url:
              $checkedConvert('pixel_tracking_url', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LyricsToJson(Lyrics instance) => <String, dynamic>{
      'lyrics_id': instance.lyrics_id,
      'lyrics_body': instance.lyrics_body,
      'pixel_tracking_url': instance.pixel_tracking_url,
    };
