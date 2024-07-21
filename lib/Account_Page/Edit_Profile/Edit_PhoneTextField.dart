import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Edit_PhoneTextField extends StatefulWidget{
  Edit_PhoneTextField({Key? key,required this.phonecontroller});
  TextEditingController phonecontroller;

  @override
  State<Edit_PhoneTextField> createState() => _Edit_PhoneTextFieldState();
}

class _Edit_PhoneTextFieldState extends State<Edit_PhoneTextField> {
       Color textcolor = Colors.black;
         String? _phone;


  @override
  Widget build(BuildContext context){
    return TextFormField(
                        controller: widget.phonecontroller,
                        style: TextStyle(color: textcolor),
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _phone = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).Please_enter_your_phone_number;
                          } else if (value.length < 11) {
                            return S.of(context).Phone_number_should_be_atleast_11_number;
                          }
                        },
                      );
  }
}