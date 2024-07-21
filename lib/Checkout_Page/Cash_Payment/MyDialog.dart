import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Verification/OTPPage.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/showSnackBar.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
  
}

class _MyDialogState extends State<MyDialog> {
  bool _checkboxValue = false;
  String _phoneNumber = '';

   @override
  void initState() {
    super.initState();
    _fetchPhoneNumber();
  }

  Future<void> _fetchPhoneNumber() async {
     final user = FirebaseAuth.instance.currentUser;
     String? email = user!.email;

    if (email!= null) {
      final userphone = await FirebaseFirestore.instance
          .collection('users')
        .where('email', isEqualTo: email)
        .get();

          if (userphone.docs.isNotEmpty) {
      setState(() {
        _phoneNumber = userphone.docs.first.get('phone');
      });
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(
        S.of(context).Verify_your_mobile_number_to_place_an_order,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(S.of(context).We_will_send_a_4digit_code_to,
              style: TextStyle(fontSize: 12)),
           Text(
            _phoneNumber,
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(15)),
                  ),
                  child: CheckboxListTile(
                    value: _checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        _checkboxValue = value!;
                      });
                    },
                    title:  Text(S.of(context).Send_SMS),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child:  Text("Get code"),
            onPressed: () {
              if (!_checkboxValue) {
                showSnackBar(context, S.of(context).Please_select_Send_SMS);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return OTPPage();
                }));
              }
            },
          ),
        ],
      ),
    );
  }
}