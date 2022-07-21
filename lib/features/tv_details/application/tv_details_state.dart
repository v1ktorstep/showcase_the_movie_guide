part of 'tv_details_bloc.dart';

@freezed
class TvDetailsState with _$TvDetailsState {
  const factory TvDetailsState.initial() = Initial;

  const factory TvDetailsState.loaded(TvDetails details) = Loaded;
}
