import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Cart_Item_Design extends StatefulWidget {
  Cart_Item_Design(
      {super.key,
      required this.cart_model,
      required this.ondelete,
      required this.home_page_model});
  Cart_Model cart_model;
  Function() ondelete;
  Home_Page_Model home_page_model;

  @override
  State<Cart_Item_Design> createState() => _Cart_Item_DesignState();
}

class _Cart_Item_DesignState extends State<Cart_Item_Design> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Dismissible(
        key: Key(widget.cart_model.Name!),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          widget.ondelete();
        },
        background: Container(
          height: DeviceDimenssions.deviceHeight * .16,
          decoration: BoxDecoration(
            color: Colors.red, // Background color when swiping

            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 155, 155, 155),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Colors.white),
              Text(
                S.of(context).delete,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          ), // Icon to show when swiping
        ),
        child: Container(
          height: DeviceDimenssions.deviceHeight * .15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 155, 155, 155),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.cart_model.image,
                    width: DeviceDimenssions.deviceWidth*.3,
                    height: DeviceDimenssions.deviceHeight * .1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cart_model.Name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                            "${widget.cart_model.price!} EGP", // added dollar sign
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(width: DeviceDimenssions.deviceWidth*.1),
                          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    InkWell(
                      onTap: () {
                        _DicreaseProduct(
                            widget.cart_model, widget.home_page_model);
                      },
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        child: const Icon(
                          size: 20,
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(
                      '${widget.cart_model.quantity}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        _IncreaseProduct(
                            widget.cart_model, widget.home_page_model);
                      },
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        child: const Icon(
                          size: 20,
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                    ],
                  ),
                
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  void _IncreaseProduct(Cart_Model cartModel, Home_Page_Model home_page_model) {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    FirebaseFirestore.instance
        .collection('UserCart')
        .where('UserEmail', isEqualTo: email)
        .where('ProductName', isEqualTo: cartModel.Name)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      int currentQuantity = querySnapshot.docs[0]['quantity'];
      int updatedQuantity = currentQuantity + 1;
      int currentProductPrice = querySnapshot.docs[0]['ProductPrice'];
      num updatedProductPrice = currentProductPrice + home_page_model.price;
      for (var document in querySnapshot.docs) {
        await document.reference.update({
          'ProductPrice': updatedProductPrice,
          'quantity': updatedQuantity,
        });
      }
      setState(() {
        cartModel.quantity = updatedQuantity;
        cartModel.price = updatedProductPrice;
      });
    }).catchError((error) {
      print('Error checking document: $error');
    });
  }

  void _DicreaseProduct(Cart_Model cartModel, Home_Page_Model home_page_model) {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
    FirebaseFirestore.instance
        .collection('UserCart')
        .where('UserEmail', isEqualTo: email)
        .where('ProductName', isEqualTo: cartModel.Name)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      int currentQuantity = querySnapshot.docs[0]['quantity'];
      if (currentQuantity > 1) {
        int updatedQuantity = currentQuantity - 1;
        int currentProductPrice = querySnapshot.docs[0]['ProductPrice'];
        num updatedProductPrice = currentProductPrice - home_page_model.price;
        for (var document in querySnapshot.docs) {
          await document.reference.update({
            'ProductPrice': updatedProductPrice,
            'quantity': updatedQuantity,
          });
        }
        setState(() {
          cartModel.quantity = updatedQuantity;
          cartModel.price = updatedProductPrice;
        });
      }
    }).catchError((error) {
      print('Error checking document: $error');
    });
  }
}
