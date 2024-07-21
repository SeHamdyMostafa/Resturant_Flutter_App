import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Pirthdate_TextField extends StatefulWidget{
  Pirthdate_TextField({super.key,required this.dateInput});
  TextEditingController dateInput;
  
  


  @override
  State<Pirthdate_TextField> createState() => _Pirthdate_TextFieldState();
}

class _Pirthdate_TextFieldState extends State<Pirthdate_TextField> {
    String? _Date;

@override
  Widget build(BuildContext context) {
   return TextFormField(
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      controller: widget.dateInput,
                      decoration:  InputDecoration(
                        labelText: S.of(context).Birthdate,
                        hintText: S.of(context).Enter_your_pirthdate,
                        labelStyle: TextStyle(color: Colors.grey),
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
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ), //icon of text field
                        //label text of field
                      ),
                      readOnly: true,
                      onChanged: (value) {
                        setState(() {
                          _Date = value;
                        });
                      },
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            widget.dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).Please_enter_your_Birth_date;
                        }
                        return null;
                      },
                    );
  }
}