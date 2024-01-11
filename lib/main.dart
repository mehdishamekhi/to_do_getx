import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_getx/screens/homescreen.dart';
import 'package:to_do_getx/screens/todoscreen.dart';

void main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
