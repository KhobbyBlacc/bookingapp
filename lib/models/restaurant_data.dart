import 'package:flutter/material.dart';

class Restaurants with ChangeNotifier {
  final String id;
  final String resName;
  final String resImg;
  final String location;
  final double price;
  final String phone;
  final String email;

  Restaurants(
      {required this.phone,
      required this.email,
      required this.id,
      required this.resName,
      required this.resImg,
      required this.location,
      required this.price});
}

class Eattery with ChangeNotifier {
  final List<Restaurants> _res = [
    Restaurants(
        id: '1',
        resName: 'Kuuks Order',
        resImg: 'assets/images/res1.jpg',
        location: 'Lapaz Com, GE-323-323',
        price: 70,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
    Restaurants(
        id: '2',
        resName: 'Mannie\'s Cuisine',
        resImg: 'assets/images/res2.jpg',
        location: 'Abokobi, GE-233-683',
        price: 120,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
    Restaurants(
        id: '3',
        resName: 'GwenSipsNBites',
        resImg: 'assets/images/res3.jpg',
        location: 'Haatso, GE-343-983',
        price: 100,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
    Restaurants(
        id: '4',
        resName: 'KFC',
        resImg: 'assets/images/res4.jpg',
        location: 'Airport Res., GE-001-003',
        price: 200,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
    Restaurants(
        id: '5',
        resName: 'Star Bite',
        resImg: 'assets/images/res5.jpg',
        location: 'East Legon, GE-002-021',
        price: 140,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
    Restaurants(
        id: '6',
        resName: 'Movenpic',
        resImg: 'assets/images/res6.jpg',
        location: 'Sankara, GE-020-434',
        price: 200,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
         Restaurants(
        id: '7',
        resName: 'Emems pepperSoup',
        resImg: 'assets/images/res7.jpg',
        location: 'Negeria, Ni-010-334',
        price: 333,
        email: 'ohjoo@gmail.com',
        phone: '0246505619'),
  ];

  List<Restaurants> get res {
    return [..._res];
  }

  Restaurants findById(String id) {
    return _res.firstWhere((resId) => resId.id == id);
  }
}
