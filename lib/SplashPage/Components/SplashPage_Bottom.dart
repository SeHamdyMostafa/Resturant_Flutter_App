import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:slider_button/slider_button.dart';

class SplashPage_Bottom extends StatelessWidget {
  const SplashPage_Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      
              action: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const RegisterPage();
                }));
                return false;
              },
              backgroundColor: Colors.orange,
              baseColor:Colors.grey,
              label:  Text(
                S.of(context).Slide_to_start,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              icon: const Center(
                  child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
                size: 30.0,
              )),
              boxShadow: BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2,
              ),
            );
  }
}