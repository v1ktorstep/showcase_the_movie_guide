import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/search_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/media_model.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';

part 'search_page_model.freezed.dart';

part 'search_page_model.g.dart';

@freezed
class SearchPageModel with _$SearchPageModel {
  const SearchPageModel._();

  const factory SearchPageModel(
    @JsonKey(name: 'page') int page,
    @JsonKey(name: 'results') List<MediaModel> results,
    @JsonKey(name: 'total_results') int totalResults,
    @JsonKey(name: 'total_pages') int totalPages,
  ) = _SearchPageModel;

  factory SearchPageModel.fromJson(Map<String, dynamic> json) =>
      _$SearchPageModelFromJson(json);

  SearchPage toDomain() {
    return SearchPage(
      page: page,
      results: results.mapAsList((e) => e.toDomain()),
      totalResults: totalResults,
      totalPages: totalPages,
    );
  }
}
