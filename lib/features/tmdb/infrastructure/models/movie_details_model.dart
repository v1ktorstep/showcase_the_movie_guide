import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_details.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/genre_model.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/prod_company_model.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/prod_country_model.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/spoken_lang_model.dart';

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
