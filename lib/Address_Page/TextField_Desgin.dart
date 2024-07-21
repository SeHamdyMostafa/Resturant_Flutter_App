import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class TextField_Design extends StatefulWidget {
   TextField_Design({super.key,required this.hintname,required this.controllervalue,required this.keyboardtype, required this.ontap});
   String hintname;
  dynamic controllervalue;
  dynamic keyboardtype;
  Function(String) ontap;

  @override
  State<TextField_Design> createState() => _TextField_DesignState();
}

class _TextField_DesignState extends State<TextField_Design> {
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
                    controller: widget.controllervalue,
                    keyboardType: widget.keyboardtype,
                    decoration: InputDecoration(
                      hintText: widget.hintname,
                       enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.orange),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.orange),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onChanged: widget.ontap,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                            return S.of(context).Field_is_empty;
                          } 
                            return null;
                    },
                  ),
    );
  }
}