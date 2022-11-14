import 'package:flutter/material.dart';
import 'package:ohjoo/models/categories.dart';
import 'package:ohjoo/models/restaurant_data.dart';
import 'package:ohjoo/widgets/category.dart';
import 'package:provider/provider.dart';

import '../models/categories.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/restaurant_cards.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final catPro = Provider.of<CatList>(context, listen: false);
    final catt = catPro.cat;

    final resMain = Provider.of<Eattery>(context);
    final res = resMain.res;
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color(0xFFF17532),
      child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Ohjoo",
                style: TextStyle(color: Colors.black),
              ),
              Spacer(),
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/images/user.jpg'),
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                     color: Colors.grey.withOpacity(0.4),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xff173428),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 400,
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catt.length,
                  itemBuilder: ((context, index) => ChangeNotifierProvider.value(
                      value: catt[index],
                      child: CatItems(
                        name: catt[index].name,
                        icon: catt[index].icon,
                      )))),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SizedBox(
                  height: double.maxFinite,
                  child:  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: res.length,
                      itemBuilder: ((context, index) =>
                          ChangeNotifierProvider.value(
                              value: res[index],
                              child: ListItemsCard(
                                resName: res[index].resName,
                                resImg: res[index].resImg,
                                price: res[index].price,
                                location: res[index].location,
                              ))),
                    ),
                  ),
            )
          ]),
        )
        );
  }
}
