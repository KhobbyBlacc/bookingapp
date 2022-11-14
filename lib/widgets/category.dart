import 'package:flutter/material.dart';
import 'package:ohjoo/models/categories.dart';
import 'package:provider/provider.dart';

class CatItems extends StatelessWidget {
  CatItems({required this.name, required this.icon});

  final name;
  final icon;
  @override
  Widget build(BuildContext context) {
    final catee = Provider.of<Categories>(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Color(0xff173428)),
            child:  icon,
            
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 15),
          )
        ]),
      ),
    );
  }
}
