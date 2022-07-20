import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/genre.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/prod_company.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/prod_country.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/spoken_lang.dart';

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
