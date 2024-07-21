import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Edit_Date extends StatefulWidget{
  Edit_Date({super.key,required this.dateInput});
  TextEditingController dateInput;

  @override
  State<Edit_Date> createState() => _Edit_DateState();
}

class _Edit_DateState extends State<Edit_Date> {
    Color textcolor = Colors.black;
      String? _Date;


  @override
  Widget build(BuildContext context){
    return TextFormField(
                        controller: widget.dateInput,
                        style: TextStyle(color: textcolor),
                        decoration: const InputDecoration(
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
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
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