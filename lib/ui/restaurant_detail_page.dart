import 'package:aplikasi_restaurant/widgets/restaurant_details_card.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_restaurant/provider/detail_provider.dart';
import 'package:aplikasi_restaurant/data/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/data_restaurant_detail';

 final String id;

  const RestaurantDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>(
        create: (_) => DetailProvider(detailapiservice: ApiService(), id: id),
        child: Scaffold(
          body: SafeArea(
            child: Consumer<DetailProvider>(
              builder: (context, state, _) {
                if (state.state == DetailResultState.Loading) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const LinearProgressIndicator(
                            minHeight: 5,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Memuat Data Restoran...',
                              style: Theme.of(context).textTheme.subtitle1)
                        ],
                      ),
                    ),
                  );
                } else if (state.state == DetailResultState.HasData) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      RestaurantDetailCard(daftarRestaurant: state.result!.restaurant)
                    ],
                  );
                } else if (state.state == DetailResultState.NoData) {
                  return Center(child: Text(state.message));
                } else if (state.state == DetailResultState.Error) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text(''));
                }
              },
            ),
          ),
        ),
      );
  }
}