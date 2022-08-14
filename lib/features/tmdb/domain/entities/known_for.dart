import 'package:freezed_annotation/freezed_annotation.dart';

part 'known_for.freezed.dart';

@freezed
class KnownFor with _$KnownFor {
  const KnownFor._();

  const factory KnownFor.knownForTv({
    required String? backdropPath,
    required String firstAirDate,
    required List<int> genreIds,
    required int id,
    required String name,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required String? posterPath,
    required double voteAverage,
    required int voteCount,
  }) = KnownForTv;

  const factory KnownFor.knownForMovie({
    required bool adult,
    required String? backdropPath,
    required List<int> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required String? posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = KnownForMovie;
}
