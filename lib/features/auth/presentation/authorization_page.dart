import 'dart:async';

import 'package:flutter/material.dart';
import 'package:showcase_the_movie_guide/features/auth/application/auth_bloc.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:auto_route/auto_route.dart';

class AuthorizationPage extends StatefulWidget {
  final String authorizationUrl;

  const AuthorizationPage({
    Key? key,
    required this.authorizationUrl,
  }) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.authorizationUrl,
          onWebViewCreated: _onWebViewCreated,
          navigationDelegate: _navigationDelegate,
        ),
      ),
    );
  }

  void _onWebViewCreated(WebViewPlusController controller) {
    controller.webViewController.clearCache();
    CookieManager().clearCookies();
  }

  FutureOr<NavigationDecision> _navigationDelegate(NavigationRequest nav) {
    final uri = Uri.parse(nav.url);

    if (uri.queryParameters['approved'] == 'true') {
      context.router.pop(AuthorizationStatus.approved);
      return NavigationDecision.prevent;
    } else if (uri.queryParameters['approved'] == 'false') {
      context.router.pop(AuthorizationStatus.cancelled);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }
}
