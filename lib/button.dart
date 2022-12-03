import 'package:flutter/material.dart';

Widget buildButton(bool v, Function() press) {
  return Visibility(
      visible: v,
      child: IconButton(
          splashRadius: 50,
          iconSize: 100,
          icon: Ink.image(
            image: const NetworkImage('https://illustoon.com/photo/4461.png'),
          ),
          onPressed: press));
}
