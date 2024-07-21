import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

class CategoryCardDesign extends StatelessWidget {
   CategoryCardDesign({super.key,required this.Image,required this.Name,required this.ontap});
  String? Image;
  String? Name;
  Function() ontap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
                  onTap:ontap,
                  child: Container(
                    width: DeviceDimenssions.deviceWidth * .28,
                    height: DeviceDimenssions.deviceHeight * .05,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3cd5a),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: DeviceDimenssions.deviceHeight * .08,
                          width: DeviceDimenssions.deviceWidth*.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(Image!))),
                        ),
                        Text(
                          Name!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}