import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_technique/view/detailspage.dart';
import 'package:test_technique/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      getPages: [GetPage(name: "/details", page: () => const Details())],
    );
  }
}
