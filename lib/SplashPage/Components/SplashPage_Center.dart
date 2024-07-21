import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/HomePage.dart';
import 'package:restaurantapp/generated/l10n.dart';

class SplashPage_Center extends StatelessWidget {
  const SplashPage_Center({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          S.of(context).Enjoy_the_best,
          style: TextStyle(color: Colors.black, fontSize: 36),
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).food,
              style: TextStyle(color: Colors.orange, fontSize: 36),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).With,
              style: TextStyle(color: Colors.black, fontSize: 36),
            ),
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).us,
              style: TextStyle(color: Colors.black, fontSize: 36),
            ),
            Text(
              "🍔",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: DeviceDimenssions.deviceHeight*.05),
         Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
         Text(
          "Habitant hendrerit commodo vitae rhoncus, leo a ut morbi.",
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
         Text(
          "Malesuada aliquam ullamcorper cursus tempor.",
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ],
    );
  }
}