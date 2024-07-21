import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurantapp/Address_Page/map_page.dart';
import 'package:restaurantapp/Checkout_Page/Checkout_Page.dart';
import 'package:restaurantapp/Checkout_Page/Visa_Card_Payment/Visa_Card_Payment_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Order_Summary extends StatefulWidget {
  int totalPrice;
  Order_Summary({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<Order_Summary> createState() => _Order_SummaryState();
}

class _Order_SummaryState extends State<Order_Summary> {
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 155, 155, 155),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  S.of(context).Order_Summary,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12.0),
                Text(
                  S.of(context).Order+': ${widget.totalPrice}',
                  style: const TextStyle(fontSize: 12.0),
                ),
                const SizedBox(height: 8.0),
                 Text(
                  S.of(context).Delivery+': ${15.00}',
                  style: TextStyle(fontSize: 12.0),
                ),
                const SizedBox(height: 8.0),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  S.of(context).Total+': ${widget.totalPrice + 15.00}',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,),
        
      ],
    );
  }
}
