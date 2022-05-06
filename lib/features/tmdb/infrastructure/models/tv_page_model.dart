import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/media_model.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';

part 'tv_page_model.freezed.dart';

part 'tv_page_model.g.dart';

@freezed
class TvPageModel with _$TvPageModel {
  const TvPageModel._();

  const factory TvPageModel(
    @JsonKey(name: 'page') int page,
    @JsonKey(name: 'results') List<TvModel> results,
    @JsonKey(name: 'total_results') int totalResults,
    @JsonKey(name: 'total_pages') int totalPages,
  ) = _TvPageModel;

  factory TvPageModel.fromJson(Map<String, dynamic> json) =>
      _$TvPageModelFromJson(json);

  TvPage toDomain() {
    return TvPage(
      page: page,
      results: results.mapAsList((e) => e.toDomain()).cast<Tv>(),
      totalResults: totalResults,
      totalPages: totalPages,
    );
  }
}
