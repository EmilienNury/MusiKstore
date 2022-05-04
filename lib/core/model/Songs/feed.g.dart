// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Feed',
      json,
      ($checkedConvert) {
        final val = Feed(
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
