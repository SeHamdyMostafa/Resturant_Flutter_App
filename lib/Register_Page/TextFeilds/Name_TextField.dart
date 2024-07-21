import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Name_TextField extends StatelessWidget {
  Name_TextField({super.key,required this.onChanged,required this.controller});
  Function(String) onChanged;
TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  controller: controller,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: S.of(context).Full_Name,
                        hintText:  S.of(context).Enter_your_Full_Name,
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
                          return S.of(context).Enter_your_Full_Name;
                        } else if (value.length < 8) {
                          return S.of(context).Name_should_be_atleast_8_characters;
                        }else
                          return null;
                      },
                    );
  }
}