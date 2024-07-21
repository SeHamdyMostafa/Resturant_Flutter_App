import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Order_Summary/Order_Summary.dart';

class Count_Product extends StatefulWidget {
  const Count_Product({Key? key}) : super(key: key);

  @override
  State<Count_Product> createState() => _Count_ProductState();
}

class _Count_ProductState extends State<Count_Product> {
  late Stream<QuerySnapshot> _cartItemsStream = Stream.empty();
  int _totalCount = 0;

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
        int totalCount = 0;
        for (var item in snapshot.docs) {
          int currentProductCount = item['quantity'];
          totalCount += currentProductCount;
        }

        setState(() {
          _totalCount = totalCount;
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
                  return Container(
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _totalCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                },
              );
            } else {
              return const Center(
                child: SizedBox(),
              );
            }
          },
        
    );
  }
}