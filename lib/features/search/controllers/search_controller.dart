import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logezy/api/api_provider.dart';
import 'package:logezy/common/models/response_model.dart';
import 'package:logezy/features/search/domain/models/city_model.dart';

import 'package:logezy/features/search/domain/repositories/search_repository.dart';

class SearchCityController extends ChangeNotifier {
  final SearchRepository searchRepository;
  SearchCityController({required this.searchRepository});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<City> _cities = [];
  List<City> get cities => _cities;

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;

  Future<ResponseModel> search({required String searchCity}) async {
    try {
      if (!recentSearches.contains(searchCity)) {
        addToRecentSearches(searchCity);
      }

      _isLoading = true;
      notifyListeners();

      ApiResponse response = await searchRepository.searchCity(searchCity);
      log(response.body['results'].toString());
      List cities = response.body['results'];
      log(cities.length.toString());

      _cities = cities
          .map(
            (e) => City.fromJson(e),
          )
          .toList();

      notifyListeners();
      log("Cities: $_cities");

      return ResponseModel(true, "Login successful");
    } catch (e) {
      log(e.toString());
      return ResponseModel(false, e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void getRecentSearches() async {
    _recentSearches = await searchRepository.getStringList();
    log(_recentSearches.length.toString());
    notifyListeners();
  }

  void addToRecentSearches(String city) async {
    if (!_recentSearches.contains(city)) {
      _recentSearches.add(city);
      await searchRepository.saveStringList(_recentSearches);
    }
    notifyListeners();
  }
}
