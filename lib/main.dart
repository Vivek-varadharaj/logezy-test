import 'package:flutter/material.dart';
import 'package:logezy/features/search/screens/search_screen.dart';

import 'package:logezy/helper/app_routes.dart';
import 'package:logezy/helper/dependency_injection.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providers = await initProviders();
  runApp(MyApp(
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.providers});
  final List<ChangeNotifierProvider> providers;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        title: 'Logezy demo',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.search,
        home: SearchScreen(),
      ),
    );
  }
}
