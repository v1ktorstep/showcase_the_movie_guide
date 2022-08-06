import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_movie.freezed.dart';

part 'favorite_movie.g.dart';

@freezed
class FavoriteMovie with _$FavoriteMovie {
  const factory FavoriteMovie(
    @JsonKey(name: 'adult') bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_title') String originalTitle,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'release_date') String releaseDate,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'video') bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = _FavoriteMovie;

  factory FavoriteMovie.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieFromJson(json);
}
