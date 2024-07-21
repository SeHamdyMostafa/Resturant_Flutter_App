import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Register_Page/Login_Page/Login_Form_Page.dart';
import 'package:restaurantapp/Register_Page/Signup_Page/Signup_Form_Page.dart';
import 'package:restaurantapp/generated/l10n.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Widget sizedBox = Login_Form_Page();


  @override
  Widget build(BuildContext context) {
        DeviceDimenssions.init(c: context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Background.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        "assets/Logo.png",
                      ),
                      backgroundColor: Color(0xffFAAC01),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                sizedBox = Login_Form_Page();
                              });
                            },
                            child:  Text(
                              S.of(context).Login,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 82, 80, 80),
                                  fontSize: 24),
                            ),
                          ),
                          const VerticalDivider(
                            color: Color.fromARGB(255, 82, 80, 80),
                            thickness: 2,
                            width: 10,
                            indent: 15,
                            endIndent: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                sizedBox = Signup_Form();
                              });
                            },
                            child:  Text(S.of(context).Sign_Up,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 82, 80, 80),
                                    fontSize: 24)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                sizedBox,
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
