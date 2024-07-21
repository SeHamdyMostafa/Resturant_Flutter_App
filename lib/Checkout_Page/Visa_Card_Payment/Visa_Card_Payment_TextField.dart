import 'package:flutter/material.dart';

class Visa_Card_PaymentTextField extends StatefulWidget {
  Visa_Card_PaymentTextField({super.key,required this.label,required this.controller,required this.textInputType,required this.validator});
  String label;
  TextEditingController controller;
  TextInputType textInputType;
  Function(String) validator;

  @override
  _Visa_Card_PaymentTextFieldState createState() => _Visa_Card_PaymentTextFieldState();
}

class _Visa_Card_PaymentTextFieldState extends State<Visa_Card_PaymentTextField> {
  final _cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.grey,
            ),
                     ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: widget.controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            ),
            keyboardType: widget.textInputType,
            validator: (value) {
              widget.validator;
            },
          ),
        ],
      ),
    );
  }
}