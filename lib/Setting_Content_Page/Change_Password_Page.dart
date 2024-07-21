import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Account_Page/Profile/Profile.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile/Edit_Profile_Page.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Change_Password_page extends StatefulWidget {
  const Change_Password_page({super.key});

  @override
  State<Change_Password_page> createState() => _Change_Password_pageState();
}

class _Change_Password_pageState extends State<Change_Password_page> {
  final _formKey = GlobalKey<FormState>();
  String _Current_Password = '';
  String _new_password = '';
  String _confirm_new_password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          S.of(context).Change_Password,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(children: [
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
                  return Password_Validate(value);
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
                  hintText: S.of(context).Enter_new_password,
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
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onChanged: (value) {
                  setState(() {
                    _new_password = value;
                  });
                },
                validator: (value) {
                  return Password_Validate(value);
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
                  hintText: S.of(context).Enter_confirm_new_password,
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
                    _confirm_new_password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
      return S.of(context).Please_enter_a_new_password;
    } else if (value.length < 8) {
      return S.of(context).Password_must_be_at_least_8_characters;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return S.of(context).Password_must_contain_uppercase_letter;
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return S.of(context).Password_must_contain_lowercase_letter;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return S.of(context).Password_must_contain_number;
    } else if (!value
        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return S.of(context).Password_must_contain_special_character;
    }else if (_new_password != value) {
      return S.of(context).Passwords_do_not_match;
    }
    return null;
  }
                
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
              Text(
                S.of(context).Password_must_be_at_least_8_characters_and_include,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "• "+S.of(context).number,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                "• "+S.of(context).uppercase_letter,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text("• "+S.of(context).lowercase_letter,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  )),
              Text(
                "• "+S.of(context).special_character,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
                              ],
                            ),
            ),
            SizedBox(
              height: 20,
            ),
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
                child: Text(
                  S.of(context).Submit,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String? Password_Validate(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).Please_enter_a_new_password;
    } else if (value.length < 8) {
      return S.of(context).Password;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return S.of(context).Password_must_contain_uppercase_letter;
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return S.of(context).Password_must_contain_lowercase_letter;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return S.of(context).Password_must_contain_number;
    } else if (!value
        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return S.of(context).Password_must_contain_special_character;
    }
    return null;
  }
}
