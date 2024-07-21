import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Food_Page/Food_Page.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';

class MenusCardDesign extends StatefulWidget {
  MenusCardDesign({
    super.key,
    required this.home_page_model,
    required this.cart_model
  });
  Home_Page_Model home_page_model;
  Cart_Model cart_model;

  @override
  State<MenusCardDesign> createState() => _MenusCardDesignState();
}

class _MenusCardDesignState extends State<MenusCardDesign> {
  bool _isHovered = false;
  IconData? iconData;
  CollectionReference UserFavoriate =
      FirebaseFirestore.instance.collection('UserFavoriate');

  @override
  void initState() {
    super.initState();
    checkIfDocumentExists();
  }

  void checkIfDocumentExists() {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    UserFavoriate.where('UserEmail', isEqualTo: email)
        .where('ProductName', isEqualTo: widget.home_page_model.name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          iconData = Icons.favorite;
        });
      } else {
        setState(() {
          iconData = Icons.favorite_outline;
        });
      }
    }).catchError((error) {
      print('Error checking document: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return  Food_Page(home_page_model: widget.home_page_model,cart_model: widget.cart_model,collectionname: 'UserCart',);
    }),
  );
      },
      child: Container(
        width: DeviceDimenssions.deviceWidth * .4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 205, 205, 205),
              blurRadius: 8.0,
              spreadRadius: 4.0,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ClipRRect(
                    child: Image.network(
                      widget.home_page_model.image,
                      width: DeviceDimenssions.deviceWidth *
                          .2, // corrected spelling
                      height: DeviceDimenssions.deviceHeight * .1,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: DeviceDimenssions.deviceWidth * .5,
                alignment: Alignment.center,
                child: Text(
                  widget.home_page_model.name,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.home_page_model.price} EGP',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (iconData == Icons.favorite) {
                              iconData = Icons.favorite_outline;
                              removeFromFavorites();
                            } else {
                              iconData = Icons.favorite;
                              addToFavorites();
                            }
                          });
                        },
                        child: Icon(
                          iconData,
                          color: _isHovered ? Colors.white : Colors.red,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToFavorites() {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    UserFavoriate.add({
      'UserEmail': email,
      'ProductImage': widget.home_page_model.image,
      'ProductName': widget.home_page_model.name,
      'ProductDescription': widget.home_page_model.description,
      'ProductPrice': widget.home_page_model.price,
    });
  }

  void removeFromFavorites() {
    UserFavoriate.where('ProductName', isEqualTo: widget.home_page_model.name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var documentSnapshot in querySnapshot.docs) {
        documentSnapshot.reference.delete();
      }
    });
  }
}
