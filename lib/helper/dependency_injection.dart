import 'package:logezy/api/api_provider.dart';
import 'package:logezy/features/city_weather/controllers/city_weather_controller.dart';
import 'package:logezy/features/search/controllers/search_controller.dart';
import 'package:logezy/features/search/domain/repositories/search_repository.dart';
import 'package:logezy/utils/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ChangeNotifierProvider>> initProviders() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final apiClient = ApiClient(
    appBaseUrl: AppConstants.appBaseUrl,
    sharedPreferences: sharedPreferences,
  );

  final searchRepository = SearchRepository(
    sharedPreferences: sharedPreferences,
    apiClient: apiClient,
  );

  return [
    ChangeNotifierProvider<SearchCityController>(
      create: (context) =>
          SearchCityController(searchRepository: searchRepository),
    ),
    ChangeNotifierProvider<CityWeatherController>(
      create: (context) =>
          CityWeatherController(searchRepository: searchRepository),
    ),
  ];
}
