import 'package:flutter/material.dart';
import 'package:restaurantapp/Cart_Page/Cart_Model.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Food_Page/Food_Page.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Model.dart';

class Page_View_Card extends StatelessWidget {
   Page_View_Card({super.key,required this.home_page_model,required this.cart_model});
Home_Page_Model home_page_model;
Cart_Model cart_model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Food_Page(home_page_model: home_page_model, cart_model: cart_model, collectionname: 'UserCart');
          }));
        },
        child: Container(
              height: DeviceDimenssions.deviceHeight * .5,
              width: DeviceDimenssions.deviceWidth * .5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                
              ),
              child: 
              Image.network(
                home_page_model.image,
              ),
            ),
      ),
    );
  }
}