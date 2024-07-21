import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

import 'package:url_launcher/url_launcher.dart';


class ChatOption extends StatelessWidget {
  
  String url = "https://wa.me/201281190072?";


   ChatOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
      //To remove the keyboard when button is pressed
      FocusManager.instance.primaryFocus?.unfocus();
       
       List<String> parts = url.split('?');
       String phone = parts[0].replaceAll('https://wa.me/', '');
      

      var whatsappUrl = "whatsapp://send?phone=+$phone";
      await launch(whatsappUrl);
      
    },
      child: Column(
        children: [
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:Icon(Icons.chat_outlined,size: 24,color:Color(0xff800080))
              ),
              SizedBox(height: 5,),
              Text(
                S.of(context).Chat_Us,
                style: TextStyle(fontSize: 16, color: Color(0xff800080)),
              ),  
            ],
          ),
          
        ],
      ),
    );
  }
}
