import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/NotificationPage.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Page.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Home_Page_Header extends StatefulWidget {
  Home_Page_Header({super.key});

  @override
  _Home_Page_HeaderState createState() => _Home_Page_HeaderState();
}

class _Home_Page_HeaderState extends State<Home_Page_Header> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _productNames = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProductNames();
  }

  void _fetchProductNames() {
    FirebaseFirestore.instance
        .collection('chicken_food')
        .get()
        .then((querySnapshot) {
      setState(() {
        _productNames = querySnapshot.docs
            .map((doc) => doc.get('name') as String)
            .toList();
        _products = querySnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/myphoto.jpg"),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Hamdi Mostafa',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return NotificationService.buildNotificationList();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3cd5a),
                      border: Border.all(width: 1, color: const Color(0xfff3cd5a)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Icon(Icons.notifications_outlined, color: Color.fromARGB(255, 30, 30, 30), size: 30),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: DeviceDimenssions.deviceWidth * .75,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: S.of(context).Search,
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    ),
                    onSubmitted: (value) {
                      List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredProducts = _products.where((product) {
                        String productName = product.get('name') as String;
                        return productName.toLowerCase().contains(value.toLowerCase());
                      }).toList();

                      if (filteredProducts.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Found ${filteredProducts.length} product(s) with the name "$value"'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No product found with the name "$value"'),
                          ),
                        );
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Setting_Page();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3cd5a),
                      border: Border.all(width: 1, color: const Color(0xfff3cd5a)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Icon(Icons.tune_outlined, color: Color.fromARGB(255, 30, 30, 30), size: 30),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}