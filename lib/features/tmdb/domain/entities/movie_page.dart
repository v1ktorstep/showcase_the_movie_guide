import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

part 'movie_page.freezed.dart';

@freezed
class MoviePage with _$MoviePage {
  const factory MoviePage({
    required int page,
    required List<Movie> results,
    required int totalResults,
    required int totalPages,
  }) = _MoviePage;
}
