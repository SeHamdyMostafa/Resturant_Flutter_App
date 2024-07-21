import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class ConfirmationDialog extends StatefulWidget {
  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage('assets/smile.png'),
            width: DeviceDimenssions.deviceWidth * .3,
          ),
          const SizedBox(height: 20),
           Column(
            children: [
              Text(
                S.of(context).Thanks_for_Buying,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                S.of(context).food_with_us,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
           Text(S.of(context).Your_food_will_come_in_15_min,
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final user = FirebaseAuth.instance.currentUser;
              String? email = user?.email;

              if (email != null) {
                FirebaseFirestore.instance
                    .collection('Usercart')
                    .where('email', isEqualTo: email)
                    .get()
                    .then((querySnapshot) {
                  querySnapshot.docs.forEach((doc) {
                    doc.reference.delete();
                  });
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBar(),), (route) => false,);
                });
              }
            },
            child:  Text(S.of(context).Continue_Shopping),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: DeviceDimenssions.deviceWidth * .1,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(width: 2, color: Colors.orange),
              ),
              backgroundColor: _isHovered
                  ? Colors.white
                  : const Color.fromARGB(255, 247, 157, 24),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          )
        ],
      ),
    );
  }
}