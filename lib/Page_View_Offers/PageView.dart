import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';
import 'package:restaurantapp/Page_View_Offers/Page_View_Card.dart';

class OffersPage extends StatelessWidget {
  OffersPage({super.key,required this.collectionname});
  String collectionname;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(collectionname).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          List<Home_Page_Model> list = [];
          for (var item in snapshot.data!.docs) {
            Home_Page_Model home_page_model = Home_Page_Model(
                name: item['name'],
                description: item['description'],
                price: item['price'],
                image: item['image'],
                quantity: item['quantity']);
            list.add(home_page_model);
          }
          List<Cart_Model> cartItemsList = [];
          for (var item in snapshot.data!.docs) {
            Cart_Model cart_model = Cart_Model(
                Name: item['name'],
                description: item['description'],
                price: item['price'],
                image: item['image'],
                quantity: item['quantity']);
            cartItemsList.add(cart_model);
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Page_View_Card(home_page_model: list[index],cart_model: cartItemsList[index],),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error retrieving data'),
          );
        } else {
          return  Center(
            child: Column(
              children: [
                Image(image: AssetImage('assets/no_offer.png'),height: DeviceDimenssions.deviceHeight*.2,width: DeviceDimenssions.deviceWidth*.3,
                ),
                SizedBox(height: 10,),
                Text('No available offers'),
              ],
            ),
          );
        }
      },
    );
  }
}