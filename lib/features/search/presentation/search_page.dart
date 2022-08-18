import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:showcase_the_movie_guide/core/routes/app_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.router.push(const SearchResultRoute());
          },
          child: const AbsorbPointer(
            child: TextField(),
          ),
        ),
      ],
    );
  }
}
