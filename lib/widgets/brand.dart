import 'package:flutter/material.dart';

Widget brand() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 3,
    children: [
      Text(
        "Wall",
        style: TextStyle(
            color: Colors.orange, fontSize: 35, fontWeight: FontWeight.bold,),
      ),
      Text(
        "Hub",
        style: TextStyle(
            color: Colors.black, fontSize: 35, fontWeight: FontWeight.w900),
      ),
    ],
  );
}
