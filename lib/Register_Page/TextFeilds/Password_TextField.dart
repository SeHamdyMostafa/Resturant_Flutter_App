import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Password_TextField extends StatelessWidget {
   Password_TextField({super.key ,required this.onChanged,required this.controller,required this.validator});
    Function(String) onChanged;
TextEditingController controller;
String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: S.of(context).Password,
                      hintText:S.of(context).Enter_your_Password,
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
                    validator:validator
                  );
  }
}