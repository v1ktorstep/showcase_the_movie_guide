import 'package:showcase_the_movie_guide/features/account/domain/entities/account_details.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_movies_page.dart';
import 'package:showcase_the_movie_guide/features/account/domain/entities/favorite_tv_page.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';

abstract class IAccountRepository {
  Future<AccountDetails> loadAccountDetails();

  Future<FavoriteMoviesPage> loadFavoriteMovies({int page});

  Future<FavoriteTvPage> loadFavoriteTvPage({int page});

  Future<void> markAsFavorite(Media media, bool favorite);
}
