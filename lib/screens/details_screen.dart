import 'package:flutter/material.dart';
import 'package:ohjoo/models/restaurant_data.dart';
import 'package:ohjoo/screens/booking_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  static const routeName = '/detailsScreen';
  DetailsScreen();

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final resId = ModalRoute.of(context)?.settings.arguments as String;
    final restaurantId = Provider.of<Eattery>(context).findById(resId);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 900,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            restaurantId.resName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 30),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: 350,
                          height: 300,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [ BoxShadow(
                              color: Colors.blueGrey[100]!,
                              blurRadius: 4,
                              spreadRadius: 3,
                            )]),
                          child: Stack(
                            fit: StackFit.expand,
                            children:[ ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  restaurantId.resImg,
                                  fit: BoxFit.cover,
                                )),
              Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(36),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: EdgeInsets.all(8),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('From \$${restaurantId.price}',),
                    SizedBox(width: 24),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.green
                      ),
                      child: Center(
                          child: Text(restaurantId.location)),
                    ),
                  ],
                ),
              ),
            ),
          ),
                    ]),
              ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.call,
                                  color: Colors.green,
                                  size: 25,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Call\nManager',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat-Bold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.language,
                                  color: Colors.green,
                                  size: 25,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Visit\nwebsite',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat-Bold',
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 25,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'View\nmaps',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat-Bold',
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 85,
                        decoration: const BoxDecoration(
                            color: Color(0xff173428),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
                        child: Column(
                          children: [
                            const Text('Our Menu',
                                style: TextStyle(
                                    fontFamily: 'Monserrat-Bold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white)),
                            const SizedBox(
                              height: 10,
                            ),
                            TabBar(
                              controller: _tabController,
                              labelColor: Colors.white,
                              indicatorColor: Color(0xffFDBB40),
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Tab(
                                  text: "Food",
                                ),
                                Tab(
                                  text: "Drinks",
                                ),
                                Tab(
                                  text: "Desserts",
                                ),
                                Tab(text: "Add ons")
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        child:
                            TabBarView(controller: _tabController, children: [
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Banku And Okro'),
                                  Spacer(),
                                  Text('\$4'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Yam and Kontomire'),
                                  Spacer(),
                                  Text('\$10'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Eba and Soup'),
                                  Spacer(),
                                  Text('\$15'),
                                ],
                              )
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Coke'),
                                  Spacer(),
                                  Text('\$10'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Beer'),
                                  Spacer(),
                                  Text('\$16'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Fanta'),
                                  Spacer(),
                                  Text('\$122'),
                                ],
                              )
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Banana Cake'),
                                  Spacer(),
                                  Text('\$30'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Shakers'),
                                  Spacer(),
                                  Text('\$10'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('Vanilla Cake'),
                                  Spacer(),
                                  Text('\$104'),
                                ],
                              )
                            ],
                          ),
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('AquaDot'),
                                  Spacer(),
                                  Text('\$12'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('BelCola'),
                                  Spacer(),
                                  Text('\$10'),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text('BelAqua'),
                                  Spacer(),
                                  Text('\$22'),
                                ],
                              )
                            ],
                          )
                        ]),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Material(
                          color: Color(0xff173428),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                                Navigator.of(context)
                           .pushNamed(BookingPage.routeName, arguments: resId);
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("BOOK A TABLE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
