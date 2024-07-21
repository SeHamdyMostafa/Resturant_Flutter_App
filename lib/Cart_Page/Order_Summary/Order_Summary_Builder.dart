import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurantapp/Cart_Page/AddItem_button.dart';
import 'package:restaurantapp/Cart_Page/Checkout_button.dart';
import 'package:restaurantapp/Cart_Page/Empty_Cart.dart';
import 'package:restaurantapp/Cart_Page/Order_Summary/Order_Summary.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Order_Summary_Builder extends StatefulWidget {
   Order_Summary_Builder({Key? key,required this.sizedBox}) ;
   Widget sizedBox;

  @override
  State<Order_Summary_Builder> createState() => _Order_Summary_BuilderState();
}

class _Order_Summary_BuilderState extends State<Order_Summary_Builder> {
  late Stream<QuerySnapshot> _cartItemsStream = Stream.empty();
  int _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _cartItemsStream = _fetchCartItems();
  }

  Stream<QuerySnapshot> _fetchCartItems() {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;

    if (email != null) {
      final cartItemsStream = FirebaseFirestore.instance
          .collection('UserCart')
          .where('UserEmail', isEqualTo: email)
          .snapshots();

      cartItemsStream.listen((QuerySnapshot snapshot) {
        int totalPrice = 0;
        for (var item in snapshot.docs) {
          int currentProductPrice = item['ProductPrice'];
          totalPrice += currentProductPrice;
        }

        setState(() {
          _totalPrice = totalPrice;
        });
      });

      return cartItemsStream;
    } else {
      throw Exception("User email not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _cartItemsStream,
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
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  Order_Summary(totalPrice: _totalPrice),
                  widget.sizedBox
                  
                ],
              );
            },
          );
        } else {
          return  Center(child: empty_cart());
        }
      },
    );
  }
}
