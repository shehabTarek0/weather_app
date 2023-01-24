import 'package:flutter/material.dart';

void navigatorto(context, screen) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ));
