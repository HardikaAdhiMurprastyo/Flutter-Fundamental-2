import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/model/details_restaurant.dart';


class DrinkList extends StatelessWidget {
  final RestaurantElement daftarRestaurant;
  const DrinkList({required this.daftarRestaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          padding: EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.horizontal,
            children: daftarRestaurant.menus.drinks.map((drink) => Column(
                children: [
                  Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.coffee,
                                  color: Color.fromRGBO(0, 0, 128, 1),
                                ),
                                Text(
                                  drink.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 0, 128, 1),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]
            )).toList(),
          ),
        ),
      ],
    );
  }
}
