import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/genre_model.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/prod_company_model.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/prod_country_model.dart';
import 'package:showcase_the_movie_guide/features/tmdb/infrastructure/models/spoken_lang_model.dart';
import 'package:showcase_the_movie_guide/core/extensions/list_extension.dart';

part 'tv_details_model.freezed.dart';

part 'tv_details_model.g.dart';

@freezed
class TvDetailsModel with _$TvDetailsModel {
  const TvDetailsModel._();

  const factory TvDetailsModel(
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'created_by') List<CreatedByModel> createdBy,
    @JsonKey(name: 'episode_run_time') List<int> episodeRunTime,
    @JsonKey(name: 'first_air_date') String firstAirDate,
    @JsonKey(name: 'genres') List<GenreModel> genres,
    @JsonKey(name: 'homepage') String homepage,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'in_production') bool inProduction,
    @JsonKey(name: 'languages') List<String> languages,
    @JsonKey(name: 'last_air_date') String lastAirDate,
    @JsonKey(name: 'last_episode_to_air')
        LastEpisodeToAirModel lastEpisodeToAir,
    @JsonKey(name: 'name') String name,
    // @JsonKey(name: 'next_episode_to_air') Null nextEpisodeToAir,
    @JsonKey(name: 'networks') List<NetworkModel> networks,
    @JsonKey(name: 'number_of_episodes') int numberOfEpisodes,
    @JsonKey(name: 'number_of_seasons') int numberOfSeasons,
    @JsonKey(name: 'origin_country') List<String> originCountry,
    @JsonKey(name: 'original_language') String originalLanguage,
    @JsonKey(name: 'original_name') String originalName,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'popularity') double popularity,
    @JsonKey(name: 'poster_path') String posterPath,
    @JsonKey(name: 'production_companies') List<ProdCompanyModel> prodCompanies,
    @JsonKey(name: 'production_countries') List<ProdCountryModel> prodCountries,
    @JsonKey(name: 'seasons') List<SeasonModel> seasons,
    @JsonKey(name: 'spoken_languages') List<SpokenLangModel> spokenLanguages,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'tagline') String tagline,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = _TvDetailsModel;

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvDetailsModelFromJson(json);

  TvDetails toDomain() {
    return TvDetails(
      backdropPath: backdropPath,
      createdBy: createdBy.mapAsList((e) => e.toDomain()),
      episodeRunTime: episodeRunTime,
      firstAirDate: firstAirDate,
      genres: genres.mapAsList((e) => e.toDomain()),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      languages: languages,
      lastAirDate: lastAirDate,
      lastEpisodeToAir: lastEpisodeToAir.toDomain(),
      name: name,
      networks: networks.mapAsList((e) => e.toDomain()),
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      prodCompanies: prodCompanies.mapAsList((e) => e.toDomain()),
      prodCountries: prodCountries.mapAsList((e) => e.toDomain()),
      seasons: seasons.mapAsList((e) => e.toDomain()),
      spokenLanguages: spokenLanguages.mapAsList((e) => e.toDomain()),
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

@freezed
class CreatedByModel with _$CreatedByModel {
  const CreatedByModel._();

  const factory CreatedByModel(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'credit_id') String creditId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'gender') int gender,
    @JsonKey(name: 'profile_path') String? profilePath,
  ) = _CreatedByModel;

  factory CreatedByModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByModelFromJson(json);

  CreatedBy toDomain() {
    return CreatedBy(
      id: id,
      creditId: creditId,
      name: name,
      gender: gender,
      profilePath: profilePath,
    );
  }
}

@freezed
class LastEpisodeToAirModel with _$LastEpisodeToAirModel {
  const LastEpisodeToAirModel._();

  const factory LastEpisodeToAirModel(
    @JsonKey(name: 'air_date') String airDate,
    @JsonKey(name: 'episode_number') int episodeNumber,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'production_code') String productionCode,
    @JsonKey(name: 'season_number') int seasonNumber,
    @JsonKey(name: 'still_path') String? stillPath,
    @JsonKey(name: 'vote_average') double voteAverage,
    @JsonKey(name: 'vote_count') int voteCount,
  ) = _LastEpisodeToAirModel;

  factory LastEpisodeToAirModel.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirModelFromJson(json);

  LastEpisodeToAir toDomain() {
    return LastEpisodeToAir(
      airDate: airDate,
      episodeNumber: episodeNumber,
      id: id,
      name: name,
      overview: overview,
      productionCode: productionCode,
      seasonNumber: seasonNumber,
      stillPath: stillPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

@freezed
class NetworkModel with _$NetworkModel {
  const NetworkModel._();

  const factory NetworkModel(
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'origin_country') String originCountry,
  ) = _NetworkModel;

  factory NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);

  Network toDomain() {
    return Network(
      name: name,
      id: id,
      logoPath: logoPath,
      originCountry: originCountry,
    );
  }
}

@freezed
class SeasonModel with _$SeasonModel {
  const SeasonModel._();

  const factory SeasonModel(
    @JsonKey(name: 'air_date') String airDate,
    @JsonKey(name: 'episode_count') int episodeCount,
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'overview') String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'season_number') int seasonNumber,
  ) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);

  Season toDomain() {
    return Season(
      airDate: airDate,
      episodeCount: episodeCount,
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      seasonNumber: seasonNumber,
    );
  }
}
