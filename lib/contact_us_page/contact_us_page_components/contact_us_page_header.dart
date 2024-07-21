import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class ContactUsPageHeader extends StatelessWidget {
  const ContactUsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.orange,
                ),
            ],
          ),
          Container(
              child: SizedBox(
            child: Lottie.asset(
                'assets/animated_vectors/contact_us_animation.json'),
          )),
          Container(
            alignment: Alignment.center,
            child: Text(S.of(context).Contact_with_us,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: DeviceDimenssions.deviceHeight * .04,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              S.of(context).Our_Team_Would_ike_To_Hear_You,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
