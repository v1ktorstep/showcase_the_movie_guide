part of 'movie_details_bloc.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = Initial;

  const factory MovieDetailsState.movieDetailsLoaded(
    MovieDetails details,
  ) = MovieDetailsLoaded;

  const factory MovieDetailsState.tvDetailsLoaded(
    TvDetails details,
  ) = TvDetailsLoaded;
}
