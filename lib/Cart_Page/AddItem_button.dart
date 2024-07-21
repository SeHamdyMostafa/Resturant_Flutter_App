import 'package:flutter/material.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class AddItem_Button extends StatefulWidget {
  @override
  State<AddItem_Button> createState() => _AddItem_ButtonState();
}

class _AddItem_ButtonState extends State<AddItem_Button> {
    bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
          alignment: Alignment.center,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.symmetric(horizontal: DeviceDimenssions.deviceWidth*.07,vertical: 7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2, color: Colors.orange,)),
                backgroundColor: _isHovered ? Colors.orange : Colors.white,
                foregroundColor: Colors.orange,
                elevation: 0,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BottomNavBar();
                }));
              },
              child:  Text(
                S.of(context).Add_items,
                style: TextStyle( fontSize: 24),
              ),
            ),
          ),
        
    );
  }
}