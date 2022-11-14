import 'package:flutter/material.dart';
import 'package:ohjoo/models/restaurant_data.dart';
import 'package:ohjoo/screens/details_screen.dart';
import 'package:provider/provider.dart';

class ListItemsCard extends StatelessWidget {
  ListItemsCard(
      {required this.resName,
      required this.resImg,
      required this.location,
      required this.price});

  final String resName;
  final String resImg;
  final String location;
  final double price;

  @override
  Widget build(BuildContext context) {
    final resId = Provider.of<Restaurants>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailsScreen.routeName, arguments: resId.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  resImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-Bold',
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(height: 25),
                Text(
                  '\$${price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-Bold',
                      fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
