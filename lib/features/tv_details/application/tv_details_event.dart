part of 'tv_details_bloc.dart';

@freezed
class TvDetailsEvent with _$TvDetailsEvent {
  const factory TvDetailsEvent.loadDetails(String tvId) = LoadDetails;
}
