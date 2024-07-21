import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Edit_Fullname_TextField extends StatefulWidget {
  Edit_Fullname_TextField({Key? key, required this.fullnamecontroller});
  TextEditingController fullnamecontroller;

  @override
  State<Edit_Fullname_TextField> createState() =>
      _Edit_Fullname_TextFieldState();
}

class _Edit_Fullname_TextFieldState extends State<Edit_Fullname_TextField> {
  String? _fullname;
  Color textcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fullnamecontroller,
      style: TextStyle(color: textcolor),
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.person_2_outlined,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      onChanged: (value) {
        setState(() {
          _fullname = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).Please_enter_your_Name;
        } else if (value.length < 8) {
          return S.of(context).Name_should_be_atleast_8_characters;
        }
      },
    );
  }
}
