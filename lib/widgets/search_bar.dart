import 'package:flutter/material.dart';
import 'package:aplikasi_restaurant/ui/search_page.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 75,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 4),
                padding: const EdgeInsets.only(right: 3),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 25,
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
                        padding: const EdgeInsets.only(left: 5, right: 5),
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
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextField(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const RestaurantSearchScreen(),
                                ),
                              );
                            },
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Search here ...',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                padding: const EdgeInsets.only(left: 3),
                child: const Center(
                  child: Icon(
                    Icons.filter_alt_rounded,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
