// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Items',
      json,
      ($checkedConvert) {
        final val = Items(
          id: $checkedConvert(
              'id', (v) => ItemsId.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id.toJson(),
    };
