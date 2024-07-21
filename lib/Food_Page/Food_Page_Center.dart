import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Food_Page_Center extends StatefulWidget {
  Food_Page_Center({super.key,required this.home_page_model});
      Home_Page_Model home_page_model;

  @override
  State<Food_Page_Center> createState() => _Food_Page_CenterState();
}

class _Food_Page_CenterState extends State<Food_Page_Center> {




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child:  Text(
                          S.of(context).Description,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: DeviceDimenssions.deviceHeight * .13,
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.home_page_model.description,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
      ],
    );

                    
  
  }
}