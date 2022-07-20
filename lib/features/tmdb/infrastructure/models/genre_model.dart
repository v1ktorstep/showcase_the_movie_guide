import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/genre.dart';

part 'genre_model.freezed.dart';

part 'genre_model.g.dart';

@freezed
class GenreModel with _$GenreModel {
  const GenreModel._();

  const factory GenreModel(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
  ) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Genre toDomain() {
    return Genre(id: id, name: name);
  }
}
