import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/AddItem_button.dart';
import 'package:restaurantapp/Cart_Page/Cart_Item_Design.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Checkout_Page/Checkout_Page.dart';
import 'package:restaurantapp/Cart_Page/Checkout_button.dart';
import 'package:restaurantapp/Cart_Page/Order_Summary/Order_Summary_Builder.dart';
import 'package:restaurantapp/Cart_Page/Empty_Cart.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Cart_Page extends StatefulWidget {
  Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  late Future<QuerySnapshot> _cartItemsFuture;
  bool showButtons = true;

  @override
  void initState() {
    super.initState();
    _cartItemsFuture = _fetchCartItems();
  }

  Future<QuerySnapshot> _fetchCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;

    if (email != null) {
      final cartItems = await FirebaseFirestore.instance
          .collection('UserCart')
          .where('UserEmail', isEqualTo: email)
          .get();
      return cartItems;
    } else {
      throw Exception("User email not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  Text(
          S.of(context).My_Cart,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _cartItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return const Center(
              child: Text('Error retrieving data'),
            );
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<Cart_Model> cartItemsList = [];
            for (var item in snapshot.data!.docs) {
              Cart_Model cart_model = Cart_Model(
                Name: item['ProductName'],
                description: item['ProductDescription'],
                price: item['ProductPrice'],
                image: item['ProductImage'],
                quantity: item['quantity'],
              );
              cartItemsList.add(cart_model);
            }
            List<Home_Page_Model> foodItemsList = [];
            for (var item in snapshot.data!.docs) {
              Home_Page_Model home_page_model = Home_Page_Model(
                name: item['ProductName'],
                description: item['ProductDescription'],
                price: item['ProductPrice'],
                image: item['ProductImage'],
                quantity: item['quantity'],
              );
              foodItemsList.add(home_page_model);
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Cart_Item_Design(
                            cart_model: cartItemsList[index],
                            home_page_model: foodItemsList[index],
                            ondelete: () {
                              removeFromCart(setState, cartItemsList, index);
                            },
                          );
                        },
                        childCount: cartItemsList.length,
                      ),
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    child:  Order_Summary_Builder(sizedBox: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddItem_Button(),
                      Checkoutbutton(),
                    ],
                  ),),
                  ),
                ),
              
              ],
            );
          } else {
            return empty_cart();
          }
        },
      ),
    );
  }

  void removeFromCart(
      StateSetter setState, List<Cart_Model> cartItemsList, int index) {
    setState((){
      FirebaseFirestore.instance
          .collection('UserCart')
          .where('ProductName', isEqualTo: cartItemsList[index].Name)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
          documentSnapshot.reference.delete();
        });
      }).catchError((error) {
        print("Failed to delete documents: $error");
      });
      cartItemsList.removeAt(index);
      print("Item removed");

      // Check if the cart is empty
      if (cartItemsList.isEmpty) {
        setState(() {
          showButtons = false;
        });
      }
    });
  }
}