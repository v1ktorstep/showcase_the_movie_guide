import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/genre.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/prod_company.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/prod_country.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/spoken_lang.dart';

part 'tv_details.freezed.dart';

@freezed
class TvDetails with _$TvDetails {
  const factory TvDetails({
    required String? backdropPath,
    required List<CreatedBy> createdBy,
    required List<int> episodeRunTime,
    required String firstAirDate,
    required List<Genre> genres,
    required String homepage,
    required int id,
    required bool inProduction,
    required List<String> languages,
    required String lastAirDate,
    required LastEpisodeToAir lastEpisodeToAir,
    required String name,
    // required Null nextEpisodeToAir,
    required List<Network> networks,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required List<String> originCountry,
    required String originalLanguage,
    required String originalName,
    required String overview,
    required double popularity,
    required String posterPath,
    required List<ProdCompany> prodCompanies,
    required List<ProdCountry> prodCountries,
    required List<Season> seasons,
    required List<SpokenLang> spokenLanguages,
    required String status,
    required String tagline,
    required String type,
    required double voteAverage,
    required int voteCount,
  }) = _TvDetails;
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    required int id,
    required String creditId,
    required String name,
    required int gender,
    required String? profilePath,
  }) = _CreatedBy;
}

@freezed
class LastEpisodeToAir with _$LastEpisodeToAir {
  const factory LastEpisodeToAir({
    required String airDate,
    required int episodeNumber,
    required int id,
    required String name,
    required String overview,
    required String productionCode,
    required int seasonNumber,
    required String? stillPath,
    required double voteAverage,
    required int voteCount,
  }) = _LastEpisodeToAir;
}

@freezed
class Network with _$Network {
  const factory Network({
    required String name,
    required int id,
    required String? logoPath,
    required String originCountry,
  }) = _Network;
}

@freezed
class Season with _$Season {
  const factory Season({
    required String airDate,
    required int episodeCount,
    required int id,
    required String name,
    required String overview,
    required String? posterPath,
    required int seasonNumber,
  }) = _Season;
}
