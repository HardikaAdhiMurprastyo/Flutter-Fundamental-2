import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/model/search_restaurant.dart';
import 'package:aplikasi_restaurant/ui/restaurant_detail_page.dart';

class SearchScreen extends StatelessWidget {
  final RestaurantSearch restaurant;
  const SearchScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Container(
        child: Image.network(
          "https://restaurant-api.dicoding.dev/images/medium/" +
              restaurant.pictureId,width: 70,),

      ),
      title: Text(restaurant.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.place,
                color: Colors.red,
                size: 15,
              ),
              Text(
                restaurant.city,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star_rate,
                color: Colors.amber,
                size: 15,
              ),
              Text(
                restaurant.rating.toString(),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailPage(id: restaurant.id),
          ),
        );
      },
    );
  }
}
