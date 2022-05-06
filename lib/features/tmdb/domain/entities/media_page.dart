import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

part 'media_page.freezed.dart';

@freezed
class MediaPage<T extends Media> with _$MediaPage<T> {
  const factory MediaPage({
    required int page,
    required List<T> results,
    required int totalResults,
    required int totalPages,
  }) = _MediaPage<T>;
}
