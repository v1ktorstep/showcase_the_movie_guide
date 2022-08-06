import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_tv.dart';

part 'favorite_tv_page.freezed.dart';

part 'favorite_tv_page.g.dart';

@freezed
class FavoriteTvPage with _$FavoriteTvPage {
  const factory FavoriteTvPage(
    @JsonKey(name: 'page') int page,
    @JsonKey(name: 'results') List<FavoriteTv> results,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'total_results') int totalResults,
  ) = _FavoriteTvPage;

  factory FavoriteTvPage.fromJson(Map<String, dynamic> json) =>
      _$FavoriteTvPageFromJson(json);
}
