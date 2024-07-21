import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Email_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Name_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Password_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Phone_TextField.dart';
import 'package:restaurantapp/Register_Page/TextFeilds/Pirthdate_TextField.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/showSnackBar.dart';

class Signup_Form extends StatefulWidget {
  Signup_Form({super.key});

  @override
  State<Signup_Form> createState() => _Signup_FormState();
}

class _Signup_FormState extends State<Signup_Form> {
  final _formKey = GlobalKey<FormState>();

  String? name;

  String? email;

  String? password;

  String? phoneNumber;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final phoneNumberController = TextEditingController();

  String? selectedOption;
  final dateInput = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceDimenssions.deviceWidth * .9,
          height: DeviceDimenssions.deviceHeight * .6,
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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Name_TextField(
                      controller: nameController,
                      onChanged: (Value) {
                        name = Value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Phone_TextField(
                      controller: phoneNumberController,
                      onChanged: (Value) {
                        phoneNumber = Value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Email_TextField(
                      controller: emailController,
                      onChanged: (Value) {
                        email = Value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Password_TextField(
                      controller: passwordController,
                      onChanged: (Value) {
                        password = Value;
                      },
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                return S.of(context).Please_enter_your_password;
              } else if (value.length < 8) {
                return S.of(context).Password_must_be_at_least_8_characters;
              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                return S.of(context).Password_must_contain_uppercase_letter;
              } else if (!value.contains(RegExp(r'[a-z]'))) {
                return S.of(context).Password_must_contain_lowercase_letter;
              } else if (!value.contains(RegExp(r'[0-9]'))) {
                return S.of(context).Password_must_contain_number;
              } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                return S.of(context).Password_must_contain_special_character;
              }
                      return null;
                    },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Pirthdate_TextField(dateInput: dateInput,),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child:  Text(
                            S.of(context).Gender,
                            style: TextStyle(fontSize: 24),
                          )),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Male',
                              activeColor: Colors.orange,
                              groupValue: selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                             Text(S.of(context).Male),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Female',
                              groupValue: selectedOption,
                              activeColor: Colors.orange,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value!;
                                });
                              },
                            ),
                             Text(S.of(context).Female),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: email!, password: password!);

                            users
                                .add({
                                  'full_name': nameController.text, // John Doe
                                  'email':
                                      emailController.text, // Stokes and Sons
                                  'phone': phoneNumberController.text, // 42
                                  'password': passwordController.text,
                                  'gender': selectedOption.toString(),
                                  'birthdate': dateInput.text,
                                  'UserAdress': "No address Now"
                                })
                                .then((value) => print("User Added"))
                                .catchError((error) => showSnackBar(
                                    context, "Failed to add user: $error"));

                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 3), () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                      (route) => false,
                                    );
                                  });
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Lottie.asset(
                                        'assets/animated_vectors/Sign-up-success.json',
                                        repeat: false),
                                  );
                                });
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context,
                                  S.of(context).The_password_provided_is_too_weak);
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  S.of(context).The_account_already_exists_for_that_email);
                            }
                          } catch (e) {
                            print(e);
                          }
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
                              S.of(context).Sign_Up,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
      ],
    );
  }
}
