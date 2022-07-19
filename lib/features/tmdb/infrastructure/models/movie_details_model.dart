import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';

part 'movie_details_model.freezed.dart';

part 'movie_details_model.g.dart';

@freezed
class MovieDetailsModel with _$MovieDetailsModel {
  const MovieDetailsModel._();

  const factory MovieDetailsModel(
    @JsonKey(name: 'adult') bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    // @JsonKey(name: 'belongs_to_collection') Null belongsToCollection,
    @JsonKey(name: 'budget') int budget,
    @JsonKey(name: 'genres') List<GenreModel> genres,
    @JsonKey(name: 'homepage') String? homepage,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_title') String originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'production_companies') List<ProdCompanyModel> prodCompanies,
    @JsonKey(name: 'production_countries') List<ProdCountryModel> prodCountries,
    @JsonKey(name: 'release_date') String releaseDate,
    @JsonKey(name: 'revenue') int revenue,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'spoken_languages') List<SpokenLangModel> spokenLanguages,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'tagline') String? tagline,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'video') bool video,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = _MovieDetailsModel;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  MovieDetails toDomain() {
    return MovieDetails(
      adult: adult,
      backdropPath: backdropPath,
      budget: budget,
      genres: genres.mapAsList((e) => e.toDomain()),
      homepage: homepage,
      id: id,
      imdbId: imdbId,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      prodCompanies: prodCompanies.mapAsList((e) => e.toDomain()),
      prodCountries: prodCountries.mapAsList((e) => e.toDomain()),
      releaseDate: releaseDate,
      revenue: revenue,
      runtime: runtime,
      spokenLanguages: spokenLanguages.mapAsList((e) => e.toDomain()),
      status: status,
      tagline: tagline,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

@freezed
class GenreModel with _$GenreModel {
  const GenreModel._();

  const factory GenreModel(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
  ) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Genre toDomain() {
    return Genre(id: id, name: name);
  }
}

@freezed
class ProdCompanyModel with _$ProdCompanyModel {
  const ProdCompanyModel._();

  const factory ProdCompanyModel(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'origin_country') String originCountry,
  ) = _ProdCompanyModel;

  factory ProdCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProdCompanyModelFromJson(json);

  ProdCompany toDomain() {
    return ProdCompany(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }
}

@freezed
class ProdCountryModel with _$ProdCountryModel {
  const ProdCountryModel._();

  const factory ProdCountryModel(
    @JsonKey(name: 'iso_3166_1') String iso_3166_1,
    @JsonKey(name: 'name') String name,
  ) = _ProdCountryModel;

  factory ProdCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProdCountryModelFromJson(json);

  ProdCountry toDomain() {
    return ProdCountry(iso_3166_1: iso_3166_1, name: name);
  }
}

@freezed
class SpokenLangModel with _$SpokenLangModel {
  const SpokenLangModel._();

  const factory SpokenLangModel(
    @JsonKey(name: 'iso_639_1') String iso_639_1,
    @JsonKey(name: 'name') String name,
  ) = _SpokenLangModel;

  factory SpokenLangModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLangModelFromJson(json);

  SpokenLang toDomain() {
    return SpokenLang(iso_639_1: iso_639_1, name: name);
  }
}
