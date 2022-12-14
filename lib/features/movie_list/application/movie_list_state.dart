part of 'movie_list_bloc.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = Initial;

  const factory MovieListState.loading() = Loading;

  const factory MovieListState.error() = Error;

  const factory MovieListState.loaded(
    List<ItemSource<MoviePage>> movieCategories,
    List<ItemSource<TvPage>> tvCategories,
  ) = Loaded;
}
