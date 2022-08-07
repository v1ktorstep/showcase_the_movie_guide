import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

part 'search_page.freezed.dart';

@freezed
class SearchPage with _$SearchPage {
  const factory SearchPage({
    required int page,
    required List<Media> results,
    required int totalResults,
    required int totalPages,
  }) = _SearchPage;
}
