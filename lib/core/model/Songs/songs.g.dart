// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Songs _$SongsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Songs',
      json,
      ($checkedConvert) {
        final val = Songs(
          feed: $checkedConvert(
              'feed', (v) => Feed.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SongsToJson(Songs instance) => <String, dynamic>{
      'feed': instance.feed.toJson(),
    };
