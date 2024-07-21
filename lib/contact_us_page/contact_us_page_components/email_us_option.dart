import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';


class EmailUsOption extends StatelessWidget {
  const EmailUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // will be
        String email = 'mohamadamgado9@gmail.com';
        String subject = 'User message';
        // body is the message that will be getted form message TF .
        String body =
            'Hi there, This message is Auto created by AMG , you can Edit it as you want .';
        final Uri params = Uri(
          scheme: 'mailto',
          path: email,
          query: 'subject=$subject&body=$body',
        );
        await launch(params.toString());
      },
      child: Column(
        children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.email,size: 24,color:Color(0xff86c447) ,)
              ),
              SizedBox(height: 5,),
              Text(S.of(context).Email_Us,
                  style: TextStyle(fontSize: 16, color: Color(0xff86c447))),
            ],
          ),
          
        ],
      ),
    );
  }
}
