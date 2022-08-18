import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/search_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';

part 'search_result_event.dart';

part 'search_result_state.dart';

part 'search_result_bloc.freezed.dart';

@Injectable()
class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final ITmdbRepository _repository;

  SearchResultBloc(
    this._repository,
  ) : super(const SearchResultState.initial()) {
    on<Query>(
      _query,
      transformer: ((events, mapper) {
        return events
            .distinct()
            .debounceTime(const Duration(milliseconds: 500))
            .asyncExpand(mapper);
      }),
    );
  }

  FutureOr<void> _query(Query event, Emitter<SearchResultState> emit) async {
    try {
      emit(const SearchResultState.searching());

      final initialPage = await _repository.search(event.value);

      emit(SearchResultState.searchResult(
        initialPage: initialPage,
        itemSource: (page) => _repository.search(event.value, page: page),
      ));
    } catch (e) {
      // TODO: Handle exceptions.
    }
  }
}
