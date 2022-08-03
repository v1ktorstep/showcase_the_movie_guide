import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';
import 'package:showcase_the_movie_guide/features/account/domain/i_account_repository.dart';
import 'package:showcase_the_movie_guide/features/auth/infrastructure/tmdb_auth.dart';

part 'app_login_state.dart';

part 'app_login_cubit.freezed.dart';

@Injectable()
class AppLoginCubit extends Cubit<AppLoginState> {
  final TmdbAuth _tmdbAuth;
  final IAccountRepository _accountRepository;

  AppLoginCubit(
    this._tmdbAuth,
    this._accountRepository,
  ) : super(const AppLoginState(loggedIn: false, accountDetails: null)) {
    _tmdbAuth.watchSignIn().listen(_onSignIn);
  }

  void _onSignIn(isSignedIn) async {
    if (isSignedIn) {
      emit(state.copyWith(loggedIn: isSignedIn));
      final details = await _accountRepository.loadAccountDetails();
      emit(state.copyWith(accountDetails: details));
    } else {
      emit(state.copyWith(loggedIn: false, accountDetails: null));
    }
  }
}
