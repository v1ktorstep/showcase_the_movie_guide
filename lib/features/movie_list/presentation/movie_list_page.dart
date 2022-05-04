import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/category.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/movie_list_bloc.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/movie_item.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/movie_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<MovieListBloc>()..add(const MovieListEvent.load());
      },
      child: Material(
        child: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            return state.when(
              initial: () => const _MovieListLoading(),
              loading: () => const _MovieListLoading(),
              error: () => const _MovieListError(),
              loaded: (movieCategories) {
                return ListView.builder(
                  itemCount: movieCategories.length,
                  itemBuilder: (context, index) {
                    return _MovieCategory(category: movieCategories[index]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MovieListLoading extends StatelessWidget {
  const _MovieListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _MovieListError extends StatelessWidget {
  const _MovieListError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}

class _MovieCategory extends StatefulWidget {
  final Category<MoviePage> category;

  const _MovieCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<_MovieCategory> createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<_MovieCategory> {
  final _pagingController = PagingController<int, Movie>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    final preloadedItems = widget.category.preloaded?.results;

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _pagingController.itemList = preloadedItems;
    _pagingController.nextPageKey = preloadedItems == null ? 1 : 2;
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(localizations.mediaCategories(widget.category.key)),
        ),
        SizedBox(
          height: 250,
          child: PagedListView<int, Movie>.separated(
            pagingController: _pagingController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                // TODO: Rework.
                return MovieItem(
                  posterUrl:
                      'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                  title: item.title,
                );
              },
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        )
      ],
    );
  }

  void _fetchPage(int pageKey) async {
    try {
      final page = await widget.category.source(page: pageKey);

      if (page.page < page.totalResults) {
        _pagingController.appendPage(page.results, pageKey + 1);
      } else {
        _pagingController.appendLastPage(page.results);
      }
    } catch (e) {
      // TODO: Rework.
      _pagingController.error = e;
    }
  }
}
