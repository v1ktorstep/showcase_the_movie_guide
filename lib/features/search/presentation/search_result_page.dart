import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/movie_list/presentation/movie_item.dart';
import 'package:showcase_the_movie_guide/features/search/application/search_result/search_result_bloc.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/media.dart';
import 'package:showcase_the_movie_guide/features/tmdb/domain/entities/search_page.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchResultBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const _SearchForm(),
        ),
        body: BlocBuilder<SearchResultBloc, SearchResultState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              searching: () => const Center(
                child: CircularProgressIndicator(),
              ),
              searchResult: (initialPage, itemSource) => Padding(
                padding: const EdgeInsets.all(16),
                child: _SearchResult(
                  initialPage: initialPage,
                  itemSource: itemSource,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SearchForm extends StatelessWidget {
  const _SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<SearchResultBloc>().add(SearchResultEvent.query(value));
      },
    );
  }
}

class _SearchResult extends StatefulWidget {
  final SearchPage initialPage;
  final Future<SearchPage> Function(int page) itemSource;

  const _SearchResult({
    Key? key,
    required this.initialPage,
    required this.itemSource,
  }) : super(key: key);

  @override
  State<_SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<_SearchResult> {
  final _pagingController = PagingController<int, Media>(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingController.addPageRequestListener(_fetchPage);
    _pagingController.itemList = widget.initialPage.results;
    _pagingController.nextPageKey = 2;
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Media>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return item.map(
            movie: (movie) => MovieItem(
              posterUrl: movie.posterPath ?? '',
              title: movie.title,
            ),
            tv: (tv) => MovieItem(
              posterUrl: tv.posterPath ?? '',
              title: tv.name,
            ),
            person: (person) => Text(person.name),
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3.5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }

  void _fetchPage(int pageKey) async {
    try {
      final page = await widget.itemSource(pageKey);

      if (page.page < page.totalPages) {
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
