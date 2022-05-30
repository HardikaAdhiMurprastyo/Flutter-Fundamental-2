import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/provider/list_provider.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_restaurant/data/api/api_service.dart';
import 'package:aplikasi_restaurant/widgets/restaurant_list_card.dart';
import 'package:aplikasi_restaurant/widgets/search_bar.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/detail_restaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Recommendation restaurant for you!',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.purple,
                  Colors.deepPurpleAccent,
                  Colors.blueAccent,
                ]
            ),
          ),
        ),
      ),
      body:  Column(
        children: [
          Search(),
          Flexible(
            child: ChangeNotifierProvider<ListProvider>(
              create: (_) => ListProvider(listapicervice: ApiService()),
              child: Consumer<ListProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.Loading) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const LinearProgressIndicator(
                              minHeight: 5,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Loading ...',
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                    );
                  } else if (state.state == ResultState.HasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.result!.restaurants.length,
                      itemBuilder: (context, index) {
                        var restaurant = state.result!.restaurants[index];
                        return RestaurantListCard(daftarRestaurant: restaurant);
                      },
                    );
                  } else if (state.state == ResultState.NoData) {
                    return Center(child: Text(state.message));
                  } else if (state.state == ResultState.Error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}