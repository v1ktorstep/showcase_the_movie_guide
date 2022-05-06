import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/media_model.dart';

part 'movie_page_model.freezed.dart';

part 'movie_page_model.g.dart';

@freezed
class MoviePageModel with _$MoviePageModel {
  const MoviePageModel._();

  const factory MoviePageModel(
    @JsonKey(name: 'page') int page,
    @JsonKey(name: 'results') List<MovieModel> results,
    @JsonKey(name: 'total_results') int totalResults,
    @JsonKey(name: 'total_pages') int totalPages,
  ) = _MoviePageModel;

  factory MoviePageModel.fromJson(Map<String, dynamic> json) =>
      _$MoviePageModelFromJson(json);

  MediaPage<Movie> toDomain() {
    return MediaPage<Movie>(
      page: page,
      results: results.mapAsList((e) => e.toDomain()).cast<Movie>(),
      totalResults: totalResults,
      totalPages: totalPages,
    );
  }
}
