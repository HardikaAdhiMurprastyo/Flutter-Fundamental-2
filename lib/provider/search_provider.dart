import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/api/api_service.dart';
import 'package:aplikasi_restaurant/data/model/search_restaurant.dart';

enum SearchResultState { loading, noData, hasData, error }

class SearchProvider extends ChangeNotifier {
  final ApiService searchapicervice;

  SearchProvider({required this.searchapicervice}) {
    fetchAllRestaurantSearch(query);
  }
  ResultRestaurantsSearch? _restaurantsSearch;
  String _message = '';
  SearchResultState? _state;
  final String _query = '';

  String get message => _message;
  String get query => _query;

  ResultRestaurantsSearch? get result => _restaurantsSearch;
  SearchResultState? get state => _state;

  Future<dynamic> fetchAllRestaurantSearch(String query) async {
    try {
      _state = SearchResultState.loading;
      //notifyListeners();
      final restaurant = await searchapicervice.showSearchRestaurant(query);
      if (restaurant.restaurants.isEmpty) {
        _state = SearchResultState.noData;
        notifyListeners();
        return _message = 'Maaf, Restoran yang Anda Cari Tidak Ada';
      } else {
        _state = SearchResultState.hasData;
        notifyListeners();
        return _restaurantsSearch = restaurant;
      }
    } catch (error) {
      _state = SearchResultState.error;
      notifyListeners();
      return _message = 'Maaf, Pastikan Anda Terhubung Dengan Jaringan Internet';
    }
  }
}
