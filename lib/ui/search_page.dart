import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_restaurant/data/api/api_service.dart';
import 'package:aplikasi_restaurant/provider/search_provider.dart';
import 'package:aplikasi_restaurant/widgets/search_list.dart';

class RestaurantSearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const RestaurantSearchScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantSearchScreen> createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String keyword = "";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(
        searchapicervice: ApiService(),
      ),
      child: Consumer<SearchProvider>(builder: (context, state, _) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          padding: const EdgeInsets.only(right: 3),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_outlined,
                                color: Color.fromARGB(255, 0, 0, 0),
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(190, 150, 150, 150),
                                  offset: Offset(1, 2),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding:
                                  const EdgeInsets.only(left: 5, right: 5),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black12,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.search_rounded,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: TextField(
                                      controller: _controller,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                      decoration: InputDecoration(
                                        hintText: 'Search here ...',
                                        hintStyle: TextStyle(
                                            color:
                                            Colors.black.withOpacity(0.23)),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.search,
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                      onChanged: (String value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            keyword = value;
                                          });
                                          if (value != '') {
                                            state.fetchAllRestaurantSearch(
                                                value);
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (keyword.isEmpty) const Center(
                    child: Text('Mau makan dimana hari ini?'),
                  ) else Consumer<SearchProvider>(
                    builder: (context, state, _) {
                      if (state.state == SearchResultState.loading) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else if (state.state ==
                          SearchResultState.hasData) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.result!.restaurants.length,
                          itemBuilder: (context, index) {
                            var restaurant =
                            state.result!.restaurants[index];
                            return SearchScreen(restaurant: restaurant);
                          },
                        );
                      } else if (state.state ==
                          SearchResultState.noData) {
                        state.fetchAllRestaurantSearch(keyword);
                        return Center(child: Text(state.message));
                      } else if (state.state == SearchResultState.error) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(child: Text(''));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
