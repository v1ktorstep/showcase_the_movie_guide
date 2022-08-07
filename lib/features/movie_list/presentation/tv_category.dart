import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:showcase_the_movie_guide/core/routes/app_router.dart';
import 'package:showcase_the_movie_guide/features/movie_list/application/item_source.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/movie_item.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/tv_page.dart';

class TvCategory extends StatefulWidget {
  final ItemSource<TvPage> itemSource;

  const TvCategory({
    Key? key,
    required this.itemSource,
  }) : super(key: key);

  @override
  State<TvCategory> createState() => _TvCategoryState();
}

class _TvCategoryState extends State<TvCategory> {
  final _pagingController = PagingController<int, Tv>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    final preloadedItems = widget.itemSource.preloaded?.results;

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
          child: Text(localizations.mediaCategories(widget.itemSource.key)),
        ),
        SizedBox(
          height: 250,
          child: PagedListView<int, Tv>.separated(
            pagingController: _pagingController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return GestureDetector(
                  onTap: () {
                    context.router.push(MovieDetailsRoute(media: item));
                  },
                  child: MovieItem(
                    posterUrl: item.posterPath ?? '',
                    title: item.originalName,
                  ),
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
      final page = await widget.itemSource.source(page: pageKey);

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
