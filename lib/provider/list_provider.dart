import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/api/api_service.dart';
import 'package:aplikasi_restaurant/data/model/list_restaurant.dart';

enum ResultState { Loading, NoData, HasData, Error }

class ListProvider extends ChangeNotifier {
  final ApiService listapicervice;

  ListProvider({required this.listapicervice}) {
    _fetchAllRestaurants();
  }
  RestaurantList? _restaurantList;
  String _message = '';
  ResultState? _state;

  String get message => _message;
  RestaurantList? get result => _restaurantList;
  ResultState? get state => _state;

  Future<dynamic> _fetchAllRestaurants() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await listapicervice.showListRestaurant();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantList = restaurant;
      }
    } catch (error) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Ups, Anda Sedang Tidak Terhubung Dengan Jaringan Internet';
    }
  }
}
