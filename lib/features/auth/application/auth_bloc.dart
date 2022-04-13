import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/tmdb_auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TmdbAuth _auth;

  AuthBloc(this._auth) : super(const AuthState.initial()) {
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
  }

  FutureOr<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    try {
      final token = await _auth.createRequestToken();
      final result = await event.authorize(_auth.getAuthorizationUrl(token));

      switch (result) {
        case AuthorizationStatus.approved:
          await _auth.createSession(token);
          emit(const AuthState.authenticated());
          break;
        default:
          break;
      }
    } catch (e) {
      // TODO: Handle exceptions.
      emit(const AuthState.error());
    }
  }

  FutureOr<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      await _auth.signOut();
    } catch (e) {
      // TODO: Handle exceptions.
    }
  }
}
