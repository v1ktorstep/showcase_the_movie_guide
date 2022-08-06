import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_tv.freezed.dart';

part 'favorite_tv.g.dart';

@freezed
class FavoriteTv with _$FavoriteTv {
  const factory FavoriteTv(
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'first_air_date') String firstAirDate,
    @JsonKey(name: 'genre_ids') List<int> genreIds,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_name') String originalName,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'origin_country') List<String> originCountry,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = _FavoriteTv;

  factory FavoriteTv.fromJson(Map<String, dynamic> json) =>
      _$FavoriteTvFromJson(json);
}
