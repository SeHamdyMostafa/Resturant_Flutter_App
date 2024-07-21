// Flutter code
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Cart_Page/Cart_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Food_Page/Food_Page_Center.dart';
import 'package:restaurantapp/Food_Page/Count_Product.dart';
import 'package:restaurantapp/Food_Page/Food_Page_Header.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';

class Food_Page extends StatefulWidget {
  Food_Page(
      {super.key, required this.home_page_model, required this.cart_model,required this.collectionname});
  Home_Page_Model home_page_model;
  Cart_Model cart_model;
  String collectionname;
  
  

  @override
  State<Food_Page> createState() => _Food_PageState();
}

class _Food_PageState extends State<Food_Page> {
  
  

  Widget sizedBox = SizedBox();
  Widget carticon = SizedBox();
  bool _isHovered = false;
  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }
  @override
  void initState() {
    super.initState();
    checkIfDocumentExists();
  }

  void checkIfDocumentExists() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    var querySnapshot =
        await   FirebaseFirestore.instance.collection(widget.collectionname).where('UserEmail', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        carticon = Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Cart_Page();
              }));
            },
            child: const Stack(
              children: <Widget>[
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.orange,
                  size: 35,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Count_Product(),
                ),
              ],
            ),
          ),
        );
      });
    } else if (querySnapshot.docs.isEmpty) {
      setState(() {
        carticon = sizedBox;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
            )),
        actions: [
          carticon,
        ],
      ),
      body: Column(
        children: [
          FoodPageHeader(image: widget.home_page_model.image),
          SizedBox(height: 20,),
          Container(
            width: DeviceDimenssions.deviceWidth * 1, // corrected spelling
            height: DeviceDimenssions.deviceHeight * .5,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 205, 205, 205),
                    blurRadius: 8.0,
                    spreadRadius: 4.0,
                    offset: Offset(0, 8),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      widget.home_page_model.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: DeviceDimenssions.deviceHeight * .03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: DeviceDimenssions.deviceWidth * .5,
                        child: Row(
                          children: [
                            Row(children: [
                              SizedBox(
                                width: DeviceDimenssions.deviceWidth * .1,
                                height: DeviceDimenssions.deviceHeight * .05,
                                child: FloatingActionButton(
                                  elevation: 0,
                                  onPressed: _decreaseCounter,
                                  tooltip: 'Increment',
                                  backgroundColor: Colors.orange,
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '$_counter',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: DeviceDimenssions.deviceWidth * .1,
                                height: DeviceDimenssions.deviceHeight * .05,
                                child: FloatingActionButton(
                                  elevation: 0,
                                  onPressed: _incrementCounter,
                                  tooltip: 'Increment',
                                  backgroundColor: Colors.orange,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        width: DeviceDimenssions.deviceWidth * .3,
                        child: Text(
                          '${widget.home_page_model.price} EGP',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: DeviceDimenssions.deviceHeight * .03,
                  ),
                  Food_Page_Center(
                    home_page_model: widget.home_page_model,
                  ),
                  SizedBox(height: DeviceDimenssions.deviceHeight * .015),
                  Container(
                    width: DeviceDimenssions.deviceWidth * .6,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  width: 2, color: Colors.orange)),
                          backgroundColor:
                              _isHovered ? Colors.white : Colors.orange,
                          foregroundColor: Colors.white,
                          elevation: 0,
                        ),
                        onPressed: () {
                          setState(() {
                            addToCard();
                          });
                        },
                        label: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24 ),
                            ),
                          ],
                        ),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> addToCard() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    FirebaseFirestore.instance
        .collection('UserCart')
        .where('UserEmail', isEqualTo: email)
        .where('ProductName', isEqualTo: widget.home_page_model.name)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      if (querySnapshot.docs.isNotEmpty) {
        num updatedProductPrice = widget.home_page_model.price * _counter;
        for (var document in querySnapshot.docs) {
          await document.reference.update({
            'ProductPrice': updatedProductPrice,
            'quantity': _counter,
          });
        }
      } else {
        FirebaseFirestore.instance.collection(widget.collectionname).add({
          'UserEmail': email,
          'ProductImage': widget.home_page_model.image,
          'ProductName': widget.home_page_model.name,
          'ProductDescription': widget.home_page_model.description,
          'ProductPrice': widget.home_page_model.price * _counter,
          'quantity': _counter,
        });
      }
    }).catchError((error) {
      print('Error checking document: $error');
    }).whenComplete(() {
      checkIfDocumentExists(); // Call checkIfDocumentExists() after modifying the user card
    });
  }
}
