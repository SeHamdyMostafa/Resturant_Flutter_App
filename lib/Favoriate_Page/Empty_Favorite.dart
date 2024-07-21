import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Empty_Favorite extends StatefulWidget {
  Empty_Favorite({super.key});

  @override
  State<Empty_Favorite> createState() => _Empty_FavoriteState();
}

class _Empty_FavoriteState extends State<Empty_Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/favourite.png'),
              height: DeviceDimenssions.deviceHeight * .3,
              width: DeviceDimenssions.deviceWidth * .6,
            ),
            SizedBox(height: DeviceDimenssions.deviceHeight * .06),
             Text(
              S.of(context).No_Favorites_Yet,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(height: DeviceDimenssions.deviceHeight * .06),
             Column(
              children: [
                Text(S.of(context).Mark_your_favorite_food_and_always_have,
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                Text(S.of(context).them_here,
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}