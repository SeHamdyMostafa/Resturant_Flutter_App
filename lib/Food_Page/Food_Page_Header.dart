import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

class FoodPageHeader extends StatelessWidget{
FoodPageHeader({super.key,required this.image});
dynamic image;

@override
  Widget build(BuildContext context) {
    return ClipRRect(
              child: Image.network(
                image,
                width: DeviceDimenssions.deviceWidth * .5, // corrected spelling
                height: DeviceDimenssions.deviceHeight * .3,
              ),
            );
  }
}