import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  CheckOut(Key? key, this.count, this.DateTime);

  final count;
  final DateTime;

  @override
  Widget build(BuildContext context) {
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
            title: const Text("CheckOut"),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

      ),
    );
  }
}
