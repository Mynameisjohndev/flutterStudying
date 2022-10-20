import 'package:flutter/material.dart';

inkButton() {
  return InkWell(
    onLongPress: () {},
    child: Ink(
      decoration: BoxDecoration(
        color: Colors.red[50],
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text("Precione")),
    ),
  );
}
