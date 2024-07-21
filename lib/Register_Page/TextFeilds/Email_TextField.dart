import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';


class Email_TextField extends StatelessWidget {
   Email_TextField({super.key,required this.onChanged,required this.controller});
   Function(String) onChanged;
   TextEditingController controller;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
            controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      labelText: S.of(context).Email,
                      hintText: S.of(context).Enter_your_email,
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onChanged:onChanged,
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).Please_enter_your_email;
                        } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) ==
                            false) {
                          return S.of(context).This_is_not_an_email;
                        } else
                          return null;
                      },
                  );
  }
}