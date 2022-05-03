part of 'movie_list_bloc.dart';

@freezed
class MovieListEvent with _$MovieListEvent {
  const factory MovieListEvent.load() = Load;

  const factory MovieListEvent.refresh() = Refresh;
}
