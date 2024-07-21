import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/HomePage.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:restaurantapp/SplashPage/Components/SplashPage_Bottom.dart';
import 'package:restaurantapp/SplashPage/Components/SplashPage_Center.dart';
import 'package:restaurantapp/SplashPage/Components/SplashPage_Header.dart';
import 'package:restaurantapp/StartPages/Srart_Pages_View.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageeState();
}

class _SplashPageeState extends State<SplashPage> {
   @override
  void initState() {
    super.initState();
    // Simulate a time-consuming operation, such as loading data or initializing the app
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Start_Pages_View(),
                    ),
                    (_) => false,
                  );
    });
  }

  @override
  Widget build(BuildContext context) {
    DeviceDimenssions.init(c: context);
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SplashPage_Header(),
          SplashPage_Center(),
           
        ],
      ),
    );
  }
}
