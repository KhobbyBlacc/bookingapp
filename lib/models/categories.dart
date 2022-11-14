import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  final String name;
  final icon;
  Categories({required this.name, required this.icon});
}

class CatList with ChangeNotifier {
  final List<Categories> _cat = [
    Categories(name: 'Restaurants', icon: Icon(Icons.restaurant_outlined)),
    Categories(name: 'Hotels', icon: Icon(Icons.hotel_outlined)),
    Categories(name: 'Spots', icon: Icon(Icons.local_drink_outlined)),
    Categories(name: 'Con. Halls', icon: Icon(Icons.room))
  ];

  List<Categories> get cat {
    return [..._cat];
  }
}
