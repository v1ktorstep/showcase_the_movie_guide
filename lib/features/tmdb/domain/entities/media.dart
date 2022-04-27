import 'package:freezed_annotation/freezed_annotation.dart';

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
}
