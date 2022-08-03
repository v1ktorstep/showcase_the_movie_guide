part of 'app_login_cubit.dart';

@freezed
class AppLoginState with _$AppLoginState {
  const factory AppLoginState({
    required bool loggedIn,
    AccountDetails? accountDetails,
  }) = _AppLoginState;
}
