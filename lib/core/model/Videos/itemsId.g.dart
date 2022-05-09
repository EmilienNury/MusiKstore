// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemsId.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsId _$ItemsIdFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ItemsId',
      json,
      ($checkedConvert) {
        final val = ItemsId(
          videoId: $checkedConvert('videoId', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ItemsIdToJson(ItemsId instance) => <String, dynamic>{
      'videoId': instance.videoId,
    };
