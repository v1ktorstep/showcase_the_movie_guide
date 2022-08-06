import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_movie.dart';

part 'favorite_movies_page.freezed.dart';

part 'favorite_movies_page.g.dart';

@freezed
class FavoriteMoviesPage with _$FavoriteMoviesPage {
  const factory FavoriteMoviesPage(
    @JsonKey(name: 'page') int page,
    @JsonKey(name: 'results') List<FavoriteMovie> results,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'total_results') int totalResults,
  ) = _FavoriteMoviesPage;

  factory FavoriteMoviesPage.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMoviesPageFromJson(json);
}
