import 'package:flutter/material.dart';

class DeviceDimenssions{
  static late double deviceHeight;
  static late double deviceWidth;
  static late BuildContext context;
  
  static void init({required BuildContext c}){
    context = c;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
  }
}
