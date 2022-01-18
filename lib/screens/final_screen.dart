import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      color: Colors.purple,
      child: Center(
        child: Text('Hi Leyzar',
          style: TextStyle(
            color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold
          ),),
      ),
    )
    ,
    );
  }
}
