import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Edit_Email_TextField extends StatefulWidget {
  Edit_Email_TextField({Key? key, required this.Emailcontroller});
  TextEditingController Emailcontroller;

  @override
  State<Edit_Email_TextField> createState() => _Edit_Email_TextFieldState();
}

class _Edit_Email_TextFieldState extends State<Edit_Email_TextField> {
  String? _email;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        controller: widget.Emailcontroller,
        style: const TextStyle(
          color: Colors.black,
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none, 
            enabled: false),
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).Please_enter_your_email;
          } else if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value) ==
              false) {
            return S.of(context).This_is_not_an_email;
          }
        },
      ),
    );
  }
}
