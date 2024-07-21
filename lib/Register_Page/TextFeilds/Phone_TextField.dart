import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Phone_TextField extends StatelessWidget {
  Phone_TextField({super.key,required this.onChanged,required this.controller});
  Function(String) onChanged;
TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: controller,

                    keyboardType:TextInputType.phone,
                    decoration:  InputDecoration(
                      labelText: S.of(context).Phone_number,
                      hintText: S.of(context).Enter_your_phone,
                      
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
                return S.of(context).Please_enter_your_phone_number;
              } else if (value.length < 11) {
                return S.of(context).Phone_number_should_be_atleast_11_number;
              } return null;
                    },
                  );
  }
}