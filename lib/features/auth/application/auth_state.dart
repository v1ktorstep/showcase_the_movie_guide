part of 'auth_bloc.dart';

@immutable
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.authenticated() = Authenticated;

  const factory AuthState.error() = Error;
}
