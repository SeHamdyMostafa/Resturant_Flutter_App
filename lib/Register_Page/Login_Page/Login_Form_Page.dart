import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Email_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Password_TextField.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/showSnackBar.dart';

class Login_Form_Page extends StatelessWidget {
  Login_Form_Page({super.key});
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceDimenssions.deviceWidth * .9,
          height: DeviceDimenssions.deviceHeight * .5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 205, 205, 205),
                blurRadius: 8.0,
                spreadRadius: 4.0,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    
                    children: [
                      Email_TextField(
                        controller: emailController,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      Password_TextField(
                        controller: passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        validator:  (value) {
                      if (value == null || value.isEmpty) {
                return S.of(context).Please_enter_your_password;
              } 
                      return null;
                    },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child:  Text(
                              S.of(context).Forgot_Password,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await Login_Method(context);
                          }
                        },
                        child: Container(
                          height: DeviceDimenssions.deviceHeight * 0.08,
                          width: DeviceDimenssions.deviceWidth * 0.5,
                          decoration: BoxDecoration(
                              color: const Color(0xffF54A6A),
                              borderRadius: BorderRadius.circular(20)),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).Login,
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 24,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> Login_Method(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(
              email: email!, password: password!);
      user = userCredential.user;
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavBar()),
                (route) => false,
              );
            });
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Lottie.asset(
                  'assets/animated_vectors/login_sucess.json',
                  repeat: false),
            );
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        showSnackBar(
            context, S.of(context).check_your_Email_or_password);
      } else {
        showSnackBar(context, e.code);
      }
    }
  }
}
