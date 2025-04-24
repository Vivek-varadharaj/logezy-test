import 'package:flutter/material.dart';
import 'package:logezy/features/search/screens/search_screen.dart';

class Routes {
  Routes._();

  static const search = "/search";
  static const cityDetails = "/cityDetails";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case search:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route Not Found')),
          ),
        );
    }
  }
}
