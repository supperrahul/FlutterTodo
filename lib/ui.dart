import 'package:flutter/material.dart';

Widget ui(String title,index, onPressed) {
  return Row(
    children: [
      SizedBox(
        width: 25,
      ),
      Container(
        width: 50,
        child: Text(title),
      ),
      SizedBox(
        width: 190,
      ),
      ElevatedButton(
          onPressed: () {
            onPressed(index);
          },
          child: Text("delete"))
    ],
  );
}
