import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile/Edit_Date.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile/Edit_Email_TextField.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile/Edit_Fullname_TextField.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile/Edit_PhoneTextField.dart';
import 'package:restaurantapp/Account_Page/Profile/ProfileModel.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Edit_Profile extends StatefulWidget {
  Edit_Profile({super.key, required this.profileModel});
  ProfileModel profileModel;

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController dateInput;
  late final TextEditingController emailcontroller;
  late final TextEditingController fullnamecontroller;
  late final TextEditingController phonecontroller;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController(text: widget.profileModel.email);
    fullnamecontroller = TextEditingController(text: widget.profileModel.name);
    phonecontroller = TextEditingController(text: widget.profileModel.phone);
    dateInput = TextEditingController(text: widget.profileModel.pirthdate);
    selectedOption = widget.profileModel.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          S.of(context).Edit_Profile,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {},
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/myphoto.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Edit_Email_TextField(
                            Emailcontroller: emailcontroller)),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Edit_Fullname_TextField(
                          fullnamecontroller: fullnamecontroller,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Edit_PhoneTextField(
                          phonecontroller: phonecontroller,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Edit_Date(
                          dateInput: dateInput,
                        )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                              child:  Text(
                                S.of(context).Gender,
                                style: TextStyle(fontSize: 24),
                              )),
                        ),
                      ],
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
                                  selectedOption = value;
                                  widget.profileModel.gender = value; // Update the profile model
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
                                  selectedOption = value;
                                  widget.profileModel.gender = value; // Update the profile model
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
                          onUpdate();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: DeviceDimenssions.deviceHeight *.08,
                        width: DeviceDimenssions.deviceWidth *.6,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.orange),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child:  Text(S.of(context).Save),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onUpdate() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;

    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      for (var document in querySnapshot.docs) {
        await document.reference.update({
          'full_name': fullnamecontroller.text,
          'phone': phonecontroller.text,
          'gender': selectedOption.toString(),
          'birthdate': dateInput.text,
        });
      }
    }).catchError((error) {
      print('Error checking document: $error');
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const BottomNavBar();
        },
      ),
    );
  }
}
