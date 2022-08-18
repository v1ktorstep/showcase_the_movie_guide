part of 'search_result_bloc.dart';

@freezed
class SearchResultState with _$SearchResultState {
  const factory SearchResultState.initial() = Initial;

  const factory SearchResultState.searching() = Searching;

  const factory SearchResultState.searchResult({
    required SearchPage initialPage,
    required Future<SearchPage> Function(int page) itemSource,
  }) = SearchResult;
}
