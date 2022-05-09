// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSearch _$ListSearchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ListSearch',
      json,
      ($checkedConvert) {
        final val = ListSearch(
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ListSearchToJson(ListSearch instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };
