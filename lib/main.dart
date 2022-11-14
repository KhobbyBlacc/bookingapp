import 'package:flutter/material.dart';
import 'package:ohjoo/models/categories.dart';
import 'package:ohjoo/models/restaurant_data.dart';
import 'package:ohjoo/screens/booking_screen.dart';
import 'package:ohjoo/screens/details_screen.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CatList()),
        ChangeNotifierProvider.value(value: Eattery()),
      ],
      child: MaterialApp(
        title: 'ohjoo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        iconTheme: const IconThemeData(color:Colors.white, size: 20),
        fontFamily: "Montserrat",
        primaryColor: Colors.white
        ),
        home:  Home(),
        routes: {
          DetailsScreen.routeName: (context) => DetailsScreen(),
          BookingPage.routeName:(context) => BookingPage(),
        },
      ),
    );
  }
}
