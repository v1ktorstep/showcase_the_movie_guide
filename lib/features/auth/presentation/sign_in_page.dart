import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showcase_the_movie_guide/core/di/injectable.dart';
import 'package:showcase_the_movie_guide/features/auth/application/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:showcase_the_movie_guide/core/routes/app_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset('assets/images/logo.svg'),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => _signIn(context),
                  child: const Text('Sign In'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn(BuildContext context) {
    final event = AuthEvent.signIn((url) {
      return context.router.push<AuthorizationStatus>(
        AuthorizationRoute(authorizationUrl: url),
      );
    });

    getIt<AuthBloc>().add(event);
  }
}
