import 'package:aplikasi_restaurant/widgets/drink_list.dart';
import 'package:aplikasi_restaurant/widgets/food_list.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/data/model/details_restaurant.dart';

class RestaurantDetailCard extends StatelessWidget {
  static const routeName = '/data_restaurant_detail';

  final RestaurantElement daftarRestaurant;

  const RestaurantDetailCard({required this.daftarRestaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:<Widget>[
              Image.network("https://restaurant-api.dicoding.dev/images/medium/" +
                  daftarRestaurant.pictureId),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ]
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  daftarRestaurant.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  'Category',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  padding: EdgeInsets.all(10),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: daftarRestaurant.categories.map((categories) => Column(
                        children: [
                          Text(
                            categories.name,
                            style: TextStyle(
                              fontSize: 16,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                    )).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  'Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.place,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 35.0),
                              child: Text(
                                daftarRestaurant.address,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 35.0),
                              child: Text(
                                daftarRestaurant.city,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.star_rate,
                              color:  Colors.amber,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 35.0),
                              child: Text(
                                daftarRestaurant.rating.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Text(
                  'Description',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  daftarRestaurant.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
              ],
            ),
          ),
          Text(
            'Foods',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          FoodList(daftarRestaurant: daftarRestaurant),
          Text(
            'Drinks',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          DrinkList(daftarRestaurant: daftarRestaurant),
          SizedBox(height: 10),
          Divider(color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'Reviews',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              primary: true,
              scrollDirection: Axis.vertical,
              children: daftarRestaurant.customerReviews.map((review) => Column(
                  children: [
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                    review.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(height: 5),
                                Text(
                                    review.date,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                    )
                                ),
                                SizedBox(height: 20),
                                Text(
                                    review.review,
                                    style: TextStyle(
                                        fontSize: 14,
                                    )
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}