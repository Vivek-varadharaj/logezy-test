import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logezy/api/api_provider.dart';
import 'package:logezy/common/models/response_model.dart';
import 'package:logezy/features/city_weather/domain/models/city_detail_model.dart';
import 'package:logezy/features/search/domain/models/city_model.dart';
import 'package:logezy/features/search/domain/repositories/search_repository.dart';

class CityWeatherController extends ChangeNotifier {
  final SearchRepository searchRepository;
  CityWeatherController({required this.searchRepository});
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  CurrentWeatherResponse? _currentWeatherResponse;
  CurrentWeatherResponse? get currentWeatherResponse => _currentWeatherResponse;

  Future<ResponseModel> getCityDetails({required City searchCity}) async {
    try {
      _isLoading = true;
      notifyListeners();
      ApiResponse response = await searchRepository.getCityDetails(searchCity);
      if (response.statusCode == 200) {
        _currentWeatherResponse =
            CurrentWeatherResponse.fromJson((response.body));
        log("City Details: $_currentWeatherResponse");
        notifyListeners();
      } else {
        return ResponseModel(
            false, response.body['message'] ?? "Failed to fetch city details");
      }

      return ResponseModel(true, "Login successful");
    } catch (e) {
      return ResponseModel(false, e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
