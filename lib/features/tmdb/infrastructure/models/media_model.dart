import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

part 'media_model.freezed.dart';

part 'media_model.g.dart';

@freezed
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

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  Media toDomain() {
    return map(
      movie: (model) {
        return Movie(
          posterPath: model.posterPath,
          adult: model.adult,
          overview: model.overview,
          releaseDate: model.releaseDate,
          genreIds: model.genreIds,
          id: model.id,
          originalTitle: model.originalTitle,
          originalLanguage: model.originalLanguage,
          title: model.title,
          backdropPath: model.backdropPath,
          popularity: model.popularity,
          voteCount: model.voteCount,
          video: model.video,
          voteAverage: model.voteAverage,
        );
      },
    );
  }
}
