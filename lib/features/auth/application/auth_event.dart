part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn(AuthorizationUrlCallback authorize) = SignIn;

  const factory AuthEvent.signOut() = SignOut;
}

enum AuthorizationStatus { approved, cancelled }

typedef AuthorizationUrlCallback = Future<AuthorizationStatus?> Function(
  String url,
);
