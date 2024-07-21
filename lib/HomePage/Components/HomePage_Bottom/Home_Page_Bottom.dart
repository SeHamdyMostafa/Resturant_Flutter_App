import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Menus_Card_Design.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';

class Home_Page_Bottom extends StatelessWidget {
  Home_Page_Bottom({super.key, required this.collectionname});
  String collectionname;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(collectionname).orderBy('price', descending: false).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          const Center(child: CircularProgressIndicator());
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
                child: MenusCardDesign(home_page_model: list[index],cart_model: cartItemsList[index],),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error retrieving data'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
