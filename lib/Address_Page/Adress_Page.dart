import 'package:flutter/material.dart';
import 'package:restaurantapp/Address_Page/House_Form.dart';
import 'package:restaurantapp/Address_Page/Apartment_Form.dart';
import 'package:restaurantapp/Address_Page/Office_Form.dart';
import 'package:restaurantapp/Address_Page/TextField_Desgin.dart';
import 'package:restaurantapp/Address_Page/map_page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Account_Page/Profile/Profile.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Address_Page extends StatefulWidget {
  const Address_Page({super.key});

  @override
  State<Address_Page> createState() => _Address_PageState();
}

class _Address_PageState extends State<Address_Page> {
  late Widget sizedBox;
  Color Apartment_backgroundColor = Colors.orange;
  Color House_backgroundColor = Colors.white;
  Color Office_backgroundColor = Colors.white;
  Color Apartment_foregroundColor = Colors.white;
  Color House_foregroundColor = Colors.grey;
  Color Office_foregroundColor = Colors.grey;
  Color Apartment_sidecolor = Colors.orange;
  Color House_sidecolor = Colors.grey;
  Color Office_sidecolor = Colors.grey;
  String _address = '';

@override
  void initState() {
    super.initState();
    _updateSizedBox();
  } 

   void _updateSizedBox() {
    sizedBox = Apartment_Form(address: _address);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          S.of(context).Edit_address,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            map_page(onAddressChanged: (address) {
                    setState(() {
                      _address = address;
                      _updateSizedBox();
                    });
                  }, address: _address),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                BorderSide(width: 1, color: Apartment_sidecolor)),
                        backgroundColor: Apartment_backgroundColor,
                        foregroundColor: Apartment_foregroundColor,
                        elevation: 0,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      onPressed: () {
                        setState(() {
                          Apartment_backgroundColor = Colors.orange;
                          Apartment_foregroundColor = Colors.white;
                          Apartment_sidecolor = Colors.orange;
                          House_backgroundColor = Colors.white;
                          House_foregroundColor = Colors.grey;
                          House_sidecolor = Colors.grey;
                          Office_backgroundColor = Colors.white;
                          Office_foregroundColor = Colors.grey;
                          Office_sidecolor = Colors.grey;
                          sizedBox = Apartment_Form(address: _address,);
                        });
                      },
                      icon: const Icon(Icons.apartment,size: 16,),
                      label:  Text(
                        S.of(context).Apartment,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(width: 1, color: House_sidecolor)),
                        backgroundColor: House_backgroundColor,
                        foregroundColor: House_foregroundColor,
                        elevation: 0,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      onPressed: () {
                        setState(() {
                          House_backgroundColor = Colors.orange;
                          House_foregroundColor = Colors.white;
                          House_sidecolor = Colors.orange;
                          Apartment_backgroundColor = Colors.white;
                          Apartment_foregroundColor = Colors.grey;
                          Apartment_sidecolor = Colors.grey;
                          Office_backgroundColor = Colors.white;
                          Office_foregroundColor = Colors.grey;
                          Office_sidecolor = Colors.grey;
                          sizedBox = House_Form(address: _address,);
                        });
                      },
                      icon: const Icon(Icons.house_outlined,size: 16,),
                      label:  Text(
                        S.of(context).House,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                BorderSide(width: 1, color: Office_sidecolor)),
                        backgroundColor: Office_backgroundColor,
                        foregroundColor: Office_foregroundColor,
                        elevation: 0,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      onPressed: () {
                        setState(() {
                          House_backgroundColor = Colors.white;
                          House_foregroundColor = Colors.grey;
                          House_sidecolor = Colors.grey;
                          Apartment_backgroundColor = Colors.white;
                          Apartment_foregroundColor = Colors.grey;
                          Apartment_sidecolor = Colors.grey;
                          Office_backgroundColor = Colors.orange;
                          Office_foregroundColor = Colors.white;
                          Office_sidecolor = Colors.orange;
                          sizedBox =  Office_Form(address: _address,);
                        });
                      },
                      icon: const Icon(Icons.business_outlined,size: 16,),
                      label:  Text(
                        S.of(context).Office,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
          height: DeviceDimenssions.deviceHeight * .7,
          child: sizedBox,
        )
          ],
        ),
      ),
    );
  }
}
