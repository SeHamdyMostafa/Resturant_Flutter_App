import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class empty_cart extends StatefulWidget {
  empty_cart({super.key});

  @override
  State<empty_cart> createState() => _empty_cartState();
}

class _empty_cartState extends State<empty_cart> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/food.png'),
              height: DeviceDimenssions.deviceHeight * .3,
              width: DeviceDimenssions.deviceWidth * .6,
            ),
            SizedBox(height: DeviceDimenssions.deviceHeight * .06),
             Text(
              S.of(context).No_Order_Yet,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(height: DeviceDimenssions.deviceHeight * .06),
             Column(
              children: [
                Text(S.of(context).Your_cart_is_empty_Add,
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                Text(S.of(context).something_from_the_menu,
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
          ],
        ),
      
    );
  }
}