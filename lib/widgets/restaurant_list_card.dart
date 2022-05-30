import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/model/list_restaurant.dart';
import 'package:aplikasi_restaurant/ui/restaurant_detail_page.dart';
class RestaurantListCard extends StatelessWidget {
  static const routeName = '/data_restaurant_list';

  final RestaurantListResult  daftarRestaurant;
  const RestaurantListCard({required this.daftarRestaurant});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Container(
        child: Image.network(
          "https://restaurant-api.dicoding.dev/images/medium/" +
              daftarRestaurant.pictureId,
          width: 70,
        ),
      ),
      title: Text(
          daftarRestaurant.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
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
                daftarRestaurant.city,
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
                daftarRestaurant.rating.toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailPage(id: daftarRestaurant.id),
          ),
        );
      },
    );
  }
}