import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

class StartPage_Design extends StatelessWidget {
  StartPage_Design({super.key,required this.headertext,required this.image,required this.subtext,required this.subtext2,required this.subtext3});
  String headertext;
  String subtext;
  dynamic image;
  String subtext2;
    String subtext3;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Image(image: AssetImage(image),width: DeviceDimenssions.deviceWidth*.5,height: DeviceDimenssions.deviceHeight*.3,),
          SizedBox(
            height: 30,
          ),
          Text(
            headertext,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                subtext,
                style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 109, 109, 109)),
              ),
              Text(
                subtext2,
                style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 109, 109, 109)),
              ),Text(
                subtext3,
                style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 109, 109, 109)),
              ),
              
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
      );
    
  }
}
