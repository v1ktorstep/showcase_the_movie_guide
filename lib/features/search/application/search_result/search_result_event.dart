part of 'search_result_bloc.dart';

@freezed
class SearchResultEvent with _$SearchResultEvent {
  const factory SearchResultEvent.query(String value) = Query;
}
