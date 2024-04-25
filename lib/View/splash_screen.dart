import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:machine_test_srv/Utils/constants.dart';
import 'package:machine_test_srv/Utils/route_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Get.toNamed(RouteManager.homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              Constants.backgroundImage,
            ),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: SizedBox(
            height: size.height * 0.15,
            width: size.height * 0.15,
            child: SvgPicture.asset(
              Constants.mainLogo,
              fit: BoxFit.contain,
            )),
      ),
    ));
  }
}
