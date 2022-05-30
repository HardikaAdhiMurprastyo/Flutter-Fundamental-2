import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/api/api_service.dart';
import 'package:aplikasi_restaurant/data/model/details_restaurant.dart';

enum DetailResultState { Loading, NoData, HasData, Error }

class DetailProvider extends ChangeNotifier {
  final ApiService detailapiservice;
  final String id;

  DetailProvider({required this.detailapiservice, required this.id}) {
    _fetchAllRestaurantDetail();
  }

  RestaurantDetail? _restaurantDetail;
  String _message = '';
  DetailResultState? _state;

  RestaurantDetail? get result => _restaurantDetail;

  String get message => _message;

  DetailResultState? get state => _state;

  Future<dynamic> _fetchAllRestaurantDetail() async {
    try {
      _state = DetailResultState.Loading;
      notifyListeners();

      final restaurantDetail = await detailapiservice.showDetailRestaurant(id);
      if (restaurantDetail.restaurant.id.isEmpty) {
        _state = DetailResultState.NoData;
        notifyListeners();
        return _message = 'Data tidak ditemukan';
      } else {
        _state = DetailResultState.HasData;
        notifyListeners();
        return _restaurantDetail = restaurantDetail;
      }
    } catch (error) {
      _state = DetailResultState.Error;
      notifyListeners();
      return _message = 'Ups, Anda Sedang Tidak Terhubung Dengan Jaringan Internet';
    }
  }
}
