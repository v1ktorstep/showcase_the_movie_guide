import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcase_the_movie_guide/core/routes/app_router.dart';
import 'package:showcase_the_movie_guide/features/app/application/app_login/app_login_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MovieListRoute(),
        SearchRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          appBar: AppBar(
            actions: const [
              _AccountIconButton(),
            ],
          ),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_movies_outlined),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AccountIconButton extends StatelessWidget {
  const _AccountIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLoginCubit, AppLoginState>(
      builder: (context, state) {
        if (state.loggedIn) {
          final accountDetails = state.accountDetails;

          final icon = accountDetails == null
              ? const Icon(Icons.account_circle_rounded)
              : CachedNetworkImage(
                  imageUrl:
                      'https://www.gravatar.com/avatar/${accountDetails.avatar.gravatar.hash}',
                );

          return IconButton(
            onPressed: () {},
            icon: icon,
          );
        } else {
          return IconButton(
            onPressed: () {
              context.router.push(const SignInRoute());
            },
            icon: const Icon(Icons.account_circle_rounded),
          );
        }
      },
    );
  }
}
