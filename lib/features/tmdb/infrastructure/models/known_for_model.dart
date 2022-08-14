import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/known_for.dart';

part 'known_for_model.freezed.dart';

part 'known_for_model.g.dart';

@Freezed(unionKey: 'media_type')
class KnownForModel with _$KnownForModel {
  const KnownForModel._();

  @FreezedUnionValue('tv')
  const factory KnownForModel.knownForTvModel(
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'first_air_date') String firstAirDate,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'origin_country') List<String> originCountry,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_name') String originalName,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = KnownForTvModel;

  @FreezedUnionValue('movie')
  const factory KnownForModel.knownForMovieModel(
    @JsonKey(name: 'adult') bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_title') String originalTitle,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String releaseDate,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'video') bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = KnownForMovieModel;

  factory KnownForModel.fromJson(Map<String, dynamic> json) =>
      _$KnownForModelFromJson(json);

  KnownFor toDomain() {
    return map(
      knownForTvModel: (model) {
        return KnownFor.knownForTv(
          backdropPath: model.backdropPath,
          firstAirDate: model.firstAirDate,
          genreIds: model.genreIds,
          id: model.id,
          name: model.name,
          originCountry: model.originCountry,
          originalLanguage: model.originalLanguage,
          originalName: model.originalName,
          overview: model.overview,
          posterPath: model.posterPath,
          voteAverage: model.voteAverage,
          voteCount: model.voteCount,
        );
      },
      knownForMovieModel: (model) {
        return KnownFor.knownForMovie(
          adult: model.adult,
          backdropPath: model.backdropPath,
          genreIds: model.genreIds,
          id: model.id,
          originalLanguage: model.originalLanguage,
          originalTitle: model.originalTitle,
          overview: model.overview,
          posterPath: model.posterPath,
          releaseDate: model.releaseDate,
          title: model.title,
          video: model.video,
          voteAverage: model.voteAverage,
          voteCount: model.voteCount,
        );
      },
    );
  }
}
