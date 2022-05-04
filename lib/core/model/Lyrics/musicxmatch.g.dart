// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musicxmatch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Musicxmatch _$MusicxmatchFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Musicxmatch',
      json,
      ($checkedConvert) {
        final val = Musicxmatch(
          message: $checkedConvert(
              'message', (v) => Message.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$MusicxmatchToJson(Musicxmatch instance) =>
    <String, dynamic>{
      'message': instance.message.toJson(),
    };
