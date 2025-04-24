import 'dart:convert';

import 'package:logezy/api/api_provider.dart';
import 'package:logezy/features/search/domain/models/city_model.dart';
import 'package:logezy/utils/app_constants.dart';
import 'package:logezy/utils/app_texts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SearchRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  SearchRepository({required this.sharedPreferences, required this.apiClient});

  Future<ApiResponse> searchCity(String city) async {
    try {
      ApiResponse response = await apiClient.getData(
          "https://geocoding-api.open-meteo.com/v1/search?name=$city",
          handleError: false);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.body['message'] ?? "Registration failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> getCityDetails(City city) async {
    try {
      ApiResponse response = await apiClient.getData(
          "https://api.open-meteo.com/v1/forecast?latitude=${city.latitude},&longitude=${city.longitude}&current_weather=true",
          handleError: false);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.body['message'] ?? "Registration failed");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveStringList(List<String> values) async {
    await sharedPreferences.setStringList('my_strings', values);
  }

  Future<List<String>> getStringList() async {
    return sharedPreferences.getStringList('my_strings') ?? [];
  }
}
