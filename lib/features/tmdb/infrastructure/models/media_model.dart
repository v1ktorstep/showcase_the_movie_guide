import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/core/constants.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/known_for_model.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';

part 'media_model.freezed.dart';

part 'media_model.g.dart';

@Freezed(unionKey: 'media_type', unionValueCase: FreezedUnionCase.snake)
class MediaModel with _$MediaModel {
  const MediaModel._();

  const factory MediaModel.movie(
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'adult') bool adult,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'release_date') String releaseDate,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'original_title') String originalTitle,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'vote_count') int voteCount,
    @JsonKey(name: 'video') bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
  ) = MovieModel;

  const factory MediaModel.tv(
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'first_air_date') String firstAirDate,
    @JsonKey(name: 'origin_country') List<String> originCountry,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'vote_count') int voteCount,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'original_name') String originalName,
  ) = TvModel;

  const factory MediaModel.person(
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'adult') bool adult,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'known_for') List<KnownForModel> knownFor,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'popularity') double popularity,
  ) = PersonModel;

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Media toDomain() {
    return map(
      movie: (model) {
        return Movie(
          posterPath: '${Constants.posterBaseUrl}${model.posterPath}',
          adult: model.adult,
          overview: model.overview,
          releaseDate: model.releaseDate,
          genreIds: model.genreIds,
          id: model.id,
          originalTitle: model.originalTitle,
          originalLanguage: model.originalLanguage,
          title: model.title,
          backdropPath: '${Constants.backdropBaseUrl}${model.backdropPath}',
          popularity: model.popularity,
          voteCount: model.voteCount,
          video: model.video,
          voteAverage: model.voteAverage,
        );
      },
      tv: (model) {
        return Tv(
          posterPath: '${Constants.posterBaseUrl}${model.posterPath}',
          popularity: model.popularity,
          id: model.id,
          backdropPath: '${Constants.backdropBaseUrl}${model.backdropPath}',
          voteAverage: model.voteAverage,
          overview: model.overview,
          firstAirDate: model.firstAirDate,
          originCountry: model.originCountry,
          genreIds: model.genreIds,
          originalLanguage: model.originalLanguage,
          voteCount: model.voteCount,
          name: model.name,
          originalName: model.originalName,
        );
      },
      person: (model) {
        return Person(
          profilePath: model.profilePath,
          adult: model.adult,
          id: model.id,
          knownFor: model.knownFor.mapAsList((e) => e.toDomain()),
          name: model.name,
          popularity: model.popularity,
        );
      },
    );
  }
}
