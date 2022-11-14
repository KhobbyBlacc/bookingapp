import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../models/restaurant_data.dart';

class BookingPage extends StatefulWidget {
  static const routeName = '/bookingScreen';
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime dateTime = DateTime(2023, 12, 31, 10, 20);
  int isSelected = 0;

  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decreseCount() {
    if (_count < 2) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final resId = ModalRoute.of(context)?.settings.arguments as String;
    final bookingId = Provider.of<Eattery>(context).findById(resId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: Stack(alignment: AlignmentDirectional.topStart, children: [
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Book a Table"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    bookingId.resName,
                    style: const TextStyle(
                        fontFamily: 'Monserratt-Bold',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: buildRadioButton('Grand atrium', 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: buildRadioButton('OutSide', 2),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: ClipRRect(
                        child: Image.asset(
                      'assets/images/table.png',
                    )),
                  ),
                ),
              ]),
        ),
        Positioned.fill(
          child: DraggableScrollableSheet(
              minChildSize: 0.1,
              initialChildSize: 0.15,
              maxChildSize: 0.5,
              builder: (_, ScrollController) => Material(
                    elevation: 10,
                    child: Container( padding: EdgeInsets.all(20),
                          height: 400,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Color(0xff173428)),
                      child: SingleChildScrollView(
                        controller: ScrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 7,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Choose Date and Time",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 60,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        width: 2, color: Colors.white30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                         '${dateTime.month} - ${dateTime.day} - ${dateTime.year}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          DatePicker.showDatePicker(context,
                                              showTitleActions: true,
                                              minTime: DateTime.now(),
                                              maxTime: DateTime(2024, 3, 5),
                                              onChanged: (date) {
                                            print('$date');
                                          }, onConfirm: (date) {
                                            print('confirm $date');
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                        },
                                        child: Icon(
                                          Icons.calendar_month,
                                          size: 25,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 60,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        width: 2, color: Colors.white30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('${dateTime.hour} : ${dateTime.minute}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext
                                                      context) =>
                                                  SizedBox(
                                                    height: 250,
                                                    child:
                                                        CupertinoDatePicker(
                                                      backgroundColor:
                                                          Colors.white,
                                                      initialDateTime:
                                                          dateTime,
                                                      onDateTimeChanged:
                                                          (DateTime newTime) {
                                                        setState(() {
                                                          dateTime = newTime;
                                                        });
                                                      },
                                                      use24hFormat: false,
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .time,
                                                    ),
                                                  ));
                                        },
                                        child: Icon(
                                          Icons.timer,
                                          size: 25,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('How many Guests? ',
                                 style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                                SizedBox(width: 10,),
                                 Container(
                                  width: 120,
                                  padding: EdgeInsets.all(10),
                               
                                   child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: _decreseCount,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                    border: Border.all(width: 1, color: Colors.white)
                                  ),
                                child: const Center(
                                      child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            Spacer(),
                            Center(
                                child: Text(
                                  "${_count}",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: _incrementCount,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                    border: Border.all(width: 1, color: Colors.white)
                                  ),
                                child: const Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                                   ),
                                 )
                              ],
                            ),
                            SizedBox(height: 40,),
                             Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                  Text('\$${bookingId.price}',
                           style: const TextStyle(
                        color: Colors.white,
                          fontFamily: 'Monserratt-Bold',
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),
                          const SizedBox(width: 70,),
                                 Material(
                                   color:const Color(0xff173428),
                                   borderRadius: BorderRadius.circular(10),
                                   child: InkWell(
                                     onTap: () {

                                     },
                                     borderRadius: BorderRadius.circular(10),
                                     child: Container(
                                       padding:const EdgeInsets.symmetric(
                                               vertical: 20, horizontal: 20),
                                       decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(20),
                                               border: Border.all(width: 1, color: Colors.white)),
                                       child:const Text("Checkout",
                                               style: TextStyle(
                                                   fontWeight: FontWeight.w700,
                                                   fontSize: 20,
                                                   color: Colors.white)),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                          ],
                        ),
                      ),
                    ),
                  )),
        )
      ]),
    );
  }

  buildRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isSelected = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (isSelected == index)
              ? Color.fromARGB(255, 34, 114, 81)
              : Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          side: BorderSide(
            width: 2,
            color: (isSelected == index)
                ? Color.fromARGB(255, 34, 114, 81)
                : Colors.black,
          )),
    );
  }
}
