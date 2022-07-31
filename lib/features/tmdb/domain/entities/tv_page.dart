import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

part 'tv_page.freezed.dart';

@freezed
class TvPage with _$TvPage {
  const factory TvPage({
    required int page,
    required List<Tv> results,
    required int totalResults,
    required int totalPages,
  }) = _TvPage;
}
