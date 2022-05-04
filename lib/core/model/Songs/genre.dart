import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)

class Genre{
  String genreId;
  String? name;

  Genre({required this.genreId, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

}