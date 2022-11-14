import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/contants.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[100]!,
            blurRadius: 4,
            spreadRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/images/cardbg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('1243 5234 1245 6543', style: creditCardNo),
              Image.asset('assets/mastercard.png',
                  width: 45, fit: BoxFit.fitWidth),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/chip.png', width: 30, fit: BoxFit.fitWidth),
              Text('  VALID FROM : 12/20', style: creditNormal),
              Text('  VALID TO : 12/22', style: creditNormal),
            ],
          ),
          SizedBox(height: 6),
          Text('DAN MLAYAH T', style: creditCardNo),
        ],
      ),
    );
  }
}
