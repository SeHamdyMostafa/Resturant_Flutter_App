import 'package:flutter/material.dart';
import 'package:restaurantapp/Checkout_Page/Checkout_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Checkoutbutton extends StatefulWidget {
  @override
  State<Checkoutbutton> createState() => _CheckoutbuttonState();
}

class _CheckoutbuttonState extends State<Checkoutbutton> {
    bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
          alignment: Alignment.center,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.symmetric(horizontal: DeviceDimenssions.deviceWidth*.07,vertical: 7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2, color: Color.fromARGB(255, 247, 157, 24),)),
                backgroundColor: _isHovered ? Colors.white : Colors.orange,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckoutPage();
                }));
              },
              child:  Text(
                S.of(context).Checkout,
                style: TextStyle( fontSize: 24),
              ),
            ),
          ),
        
    );
  }
}