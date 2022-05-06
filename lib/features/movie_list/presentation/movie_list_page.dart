import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/category.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/movie_list_bloc.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/movie_item.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media_page.dart';

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
              loaded: (movieCat, tvCat) {
                return ListView.builder(
                  itemCount: movieCat.length + tvCat.length,
                  itemBuilder: (context, index) {
                    if (index < movieCat.length) {
                      return _MediaCategory<Movie>(
                        category: movieCat[index],
                        itemBuilder: (context, item, index) {
                          return MovieItem(
                            posterUrl:
                                'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                            title: item.title,
                          );
                        },
                      );
                    } else {
                      return _MediaCategory<Tv>(
                        category: tvCat[index - movieCat.length],
                        itemBuilder: (context, item, index) {
                          return MovieItem(
                            posterUrl:
                                'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                            title: item.originalName,
                          );
                        },
                      );
                    }
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

class _MediaCategory<T extends Media> extends StatefulWidget {
  final Category<MediaPage<T>> category;
  final ItemWidgetBuilder<T> itemBuilder;

  const _MediaCategory({
    Key? key,
    required this.category,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  State<_MediaCategory<T>> createState() => _MediaCategoryState();
}

class _MediaCategoryState<T extends Media> extends State<_MediaCategory<T>> {
  final _pagingController = PagingController<int, T>(firstPageKey: 1);

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
          child: PagedListView<int, T>.separated(
            pagingController: _pagingController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: widget.itemBuilder,
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
