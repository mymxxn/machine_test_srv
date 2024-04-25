import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_srv/Utils/route_manger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Machine test SRV',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.splashScreen,
      getPages: RouteManager().routes,
    );
  }
}
