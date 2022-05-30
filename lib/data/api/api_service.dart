import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_restaurant/data/model/details_restaurant.dart';
import 'package:aplikasi_restaurant/data/model/list_restaurant.dart';
import 'package:aplikasi_restaurant/data/model/search_restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantList> showListRestaurant() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load List Restaurants');
    }
  }

  Future<ResultRestaurantsSearch> showSearchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=$query'));
    if (response.statusCode == 200) {
      return ResultRestaurantsSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Get Search Results');
    }
  }

  Future<RestaurantDetail> showDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/$id'));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Detail Restaurants');
    }
  }
}
