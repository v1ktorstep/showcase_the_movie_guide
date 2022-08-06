import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_media.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_movies_page.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_tv_page.dart';
import 'package:showcase_the_movie_guide/features/account/domain/i_account_repository.dart';
import 'package:showcase_the_movie_guide/features/account/infrastructure/account_service.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  final AccountService _accountService;

  AccountRepository(this._accountService);

  AccountDetails? _accountDetails;

  @override
  Future<AccountDetails> loadAccountDetails() async {
    return _accountDetails ?? await _accountService.accountDetails();
  }

  @override
  Future<FavoriteMoviesPage> loadFavoriteMovies({int page = 1}) {
    return _accountService.favoriteMovies(page: page);
  }

  @override
  Future<FavoriteTvPage> loadFavoriteTvPage({int page = 1}) {
    return _accountService.favoriteTv(page: page);
  }

  @override
  Future<void> markAsFavorite(Media media, bool favorite) async {
    await _accountService.favorite(
      media: FavoriteMedia(
        media.map(movie: (_) => 'movie', tv: (_) => 'tv'),
        media.id,
        favorite,
      ),
    );
  }
}
