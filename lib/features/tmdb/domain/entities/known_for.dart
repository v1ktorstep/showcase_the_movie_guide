import 'package:freezed_annotation/freezed_annotation.dart';

part 'known_for.freezed.dart';

@freezed
class KnownFor with _$KnownFor {
  const factory KnownFor({
    required String? posterPath,
    required bool adult,
    required String overview,
    required String releaseDate,
    required String originalTitle,
    required List<int> genreIds,
    required int id,
    required String mediaType,
    required String originalLanguage,
    required String title,
    required String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
  }) = _KnownFor;
}
