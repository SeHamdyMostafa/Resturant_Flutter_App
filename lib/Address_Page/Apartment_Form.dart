import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Address_Page/TextField_Desgin.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Apartment_Form extends StatefulWidget {
  const Apartment_Form({super.key,required this.address});
  final String address;

  @override
  State<Apartment_Form> createState() => _Apartment_FormState();
}

class _Apartment_FormState extends State<Apartment_Form> {
  final _formKey = GlobalKey<FormState>();
  String? BildingName;
  String? Apartment;
  String? Floor;
  String? Street;
  String? City;

  TextEditingController BildingNamecontroller = TextEditingController();
  TextEditingController Apartmentcontroller = TextEditingController();
  TextEditingController Floorcontroller = TextEditingController();
  TextEditingController Streetcontroller = TextEditingController();
  TextEditingController Citycontroller = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField_Design(
            hintname: S.of(context).Building_Name,
            controllervalue: BildingNamecontroller,
            keyboardtype: TextInputType.text,
            ontap: (value) {
              BildingName = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: DeviceDimenssions.deviceWidth * .5,
                child: TextField_Design(
                  hintname: S.of(context).Apt_no,
                  controllervalue: Apartmentcontroller,
                  keyboardtype: TextInputType.number,
                  ontap: (value) {
                    Apartment = value;
                  },
                ),
              ),
              Container(
                width: DeviceDimenssions.deviceWidth * .5,
                child: TextField_Design(
                  hintname: S.of(context).Floor,
                  controllervalue: Floorcontroller,
                  keyboardtype: TextInputType.number,
                  ontap: (value) {
                    Floor = value;
                  },
                ),
              ),
            ],
          ),
          TextField_Design(
            hintname: S.of(context).Street_address,
            controllervalue: Streetcontroller,
            keyboardtype: TextInputType.text,
            ontap: (value) {
              Street = value;
            },
          ),
          TextField_Design(
            hintname: S.of(context).City,
            controllervalue: Citycontroller,
            keyboardtype: TextInputType.name,
            ontap: (value) {
              City = value;
            },
          ),
          SizedBox(height: 16),
          Center(
            child: GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  final user = FirebaseAuth.instance.currentUser;
                      String? email = user!.email!;

                  final QuerySnapshot snapshot = await FirebaseFirestore
                      .instance
                      .collection('users')
                      .where('email', isEqualTo: email)
                      .get();
                  final List<DocumentSnapshot> documents = snapshot.docs;
                  for (var document in documents) {
                    await document.reference.update({
                      'UserAdress': "${Streetcontroller.text}, ${BildingNamecontroller.text}, ${Apartmentcontroller.text}, ${Floorcontroller.text}, ${widget.address}",
                    });
                  }
                  // Perform login logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BottomNavBar();
                  }));
                } else {
                  print("Not Validated");
                }
              },
              child: Container(
                height: DeviceDimenssions.deviceHeight * 0.08,
                width: DeviceDimenssions.deviceWidth * 0.5,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).Save_address,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
