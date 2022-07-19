part of 'movie_details_bloc.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = Initial;

  const factory MovieDetailsState.loaded(MovieDetails details) = Loaded;
}
