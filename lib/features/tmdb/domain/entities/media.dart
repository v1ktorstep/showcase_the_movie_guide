import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/known_for.dart';

part 'media.freezed.dart';

@freezed
class Media with _$Media {
  const factory Media.movie({
    required String? posterPath,
    required bool adult,
    required String overview,
    required String releaseDate,
    required List<int> genreIds,
    required int id,
    required String originalTitle,
    required String originalLanguage,
    required String title,
    required String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
  }) = Movie;

  const factory Media.tv({
    required String? posterPath,
    required double popularity,
    required int id,
    required String? backdropPath,
    required double voteAverage,
    required String overview,
    required String firstAirDate,
    required List<String> originCountry,
    required List<int> genreIds,
    required String originalLanguage,
    required int voteCount,
    required String name,
    required String originalName,
  }) = Tv;

  const factory Media.person({
    required String? profilePath,
    required bool adult,
    required int id,
    required List<KnownFor> knownFor,
    required String name,
    required double popularity,
  }) = Person;
}
