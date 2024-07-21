import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Change_Email_Page extends StatefulWidget {
  const Change_Email_Page({super.key});

  @override
  State<Change_Email_Page> createState() => _Change_Email_PageState();
}

class _Change_Email_PageState extends State<Change_Email_Page> {
  final _formKey = GlobalKey<FormState>();
  String _Newemail='';
  String _Confirm__Newemail='';
  String _Current_Password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          S.of(context).Change_email,
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                    hintText: S.of(context).Enter_new_email,
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                onChanged: (value) {
                  setState(() {
                    _Newemail = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Please_enter_a_new_email;
                  } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value) ==
                      false) {
                    return S.of(context).This_is_not_an_email;
                  } else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                    hintText: S.of(context).Enter_confirm_email,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                onChanged: (value) {
                  setState(() {
                    _Confirm__Newemail = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).Please_enter_a_confirm_email;
                  } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value) ==
                      false) {
                    return S.of(context).This_is_not_an_email;
                  } else if(_Newemail!=value){
                    return S.of(context).Email_do_not_much;
                  }
                  else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                    hintText: S.of(context).Enter_current_password,
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                onChanged: (value) {
                  setState(() {
                    _Current_Password = value;
                  });
                },
               validator: (value) {
                    if (value == null || value.isEmpty) {
              return S.of(context).Please_enter_a_current_password;
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
            ),
            
           
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
            if (_formKey.currentState!.validate()) {
              // Perform login logic here
               /*Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Profile();
                          }));*/
            } else {
              print("Not Validated");
            }
          },
              child: Container(
                alignment: Alignment.center,
                height: DeviceDimenssions.deviceHeight * .08,
                width: DeviceDimenssions.deviceWidth * .8,
                decoration: BoxDecoration(
                  color: Colors.orange,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child:  Text(S.of(context).Submit,style: TextStyle(color: Colors.white,fontSize: 24),),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
