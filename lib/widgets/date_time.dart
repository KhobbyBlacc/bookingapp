import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
    DateTime dateTime = DateTime(3000, 2, 1, 10, 20);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
      showCupertinoModalPopup(
      context: context, 
      builder: (BuildContext context) => SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          initialDateTime: dateTime,
          onDateTimeChanged: (DateTime newTime){
            setState(() {
              dateTime = newTime;
            });
          },
          use24hFormat: true,
          mode: CupertinoDatePickerMode.date,
        ),
      ));
    },
    child: Text('${dateTime.month}/${dateTime.day}/${dateTime.year}') );
  }
}
