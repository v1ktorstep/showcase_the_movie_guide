import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details.freezed.dart';

@freezed
class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required bool adult,
    required String? backdropPath,
    // required Null belongsToCollection,
    required int budget,
    required List<Genre> genres,
    required String? homepage,
    required int id,
    required String? imdbId,
    required String originalLanguage,
    required String originalTitle,
    required String? overview,
    required double popularity,
    required String? posterPath,
    required List<ProdCompany> prodCompanies,
    required List<ProdCountry> prodCountries,
    required String releaseDate,
    required int revenue,
    required int? runtime,
    required List<SpokenLang> spokenLanguages,
    required String status,
    required String? tagline,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _MovieDetails;
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;
}

@freezed
class ProdCompany with _$ProdCompany {
  const factory ProdCompany({
    required int id,
    required String? logoPath,
    required String name,
    required String originCountry,
  }) = _ProdCompany;
}

@freezed
class ProdCountry with _$ProdCountry {
  const factory ProdCountry({
    required String iso_3166_1,
    required String name,
  }) = _ProdCountry;
}

@freezed
class SpokenLang with _$SpokenLang {
  const factory SpokenLang({
    required String iso_639_1,
    required String name,
  }) = _SpokenLang;
}
