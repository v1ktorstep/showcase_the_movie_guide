import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/known_for.dart';

part 'known_for_model.freezed.dart';

part 'known_for_model.g.dart';

@freezed
class KnownForModel with _$KnownForModel {
  const KnownForModel._();

  const factory KnownForModel(
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'adult') bool adult,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'release_date') String releaseDate,
    @JsonKey(name: 'original_title') String originalTitle,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'media_type') String mediaType,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'vote_count') int voteCount,
    @JsonKey(name: 'video') bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
  ) = _KnownForModel;

  factory KnownForModel.fromJson(Map<String, dynamic> json) =>
      _$KnownForModelFromJson(json);

  KnownFor toDomain() {
    return KnownFor(
      posterPath: posterPath,
      adult: adult,
      overview: overview,
      releaseDate: releaseDate,
      originalTitle: originalTitle,
      genreIds: genreIds,
      id: id,
      mediaType: mediaType,
      originalLanguage: originalLanguage,
      title: title,
      backdropPath: backdropPath,
      popularity: popularity,
      voteCount: voteCount,
      video: video,
      voteAverage: voteAverage,
    );
  }
}
