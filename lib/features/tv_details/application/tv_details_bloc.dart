import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_details.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/i_tmdb_repository.dart';

part 'tv_details_event.dart';

part 'tv_details_state.dart';

part 'tv_details_bloc.freezed.dart';

@Injectable()
class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final ITmdbRepository _tmdbRepository;

  TvDetailsBloc(
    this._tmdbRepository,
  ) : super(const TvDetailsState.initial()) {
    on<LoadDetails>(_loadDetails);
  }

  FutureOr<void> _loadDetails(
    LoadDetails event,
    Emitter<TvDetailsState> emit,
  ) async {
    try {
      final details = await _tmdbRepository.loadTvDetails(event.tvId);

      emit(TvDetailsState.loaded(details));
    } catch (e) {
      // TODO: Handle exceptions.
    }
  }
}
