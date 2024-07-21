import 'package:flutter/material.dart';
import 'package:restaurantapp/HomePage/Components/HomePage_Bottom/Home_Page_Bottom.dart';
import 'package:restaurantapp/HomePage/Components/Category_Card_Design.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/HomePage/Components/Home_Page_Header.dart';
import 'package:restaurantapp/Page_View_Offers/PageView.dart';
import 'package:restaurantapp/generated/l10n.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  Widget MenussizedBox = Home_Page_Bottom(
    collectionname: "chicken_food",
  );

  Widget OffersizedBox = OffersPage(collectionname:'chicken_offer');

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Home_Page_Header(),
                const SizedBox(
                  height: 10,
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.of(context).Categories,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: DeviceDimenssions.deviceHeight * .17,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryCardDesign(
                          Image: "assets/KFC.png",
                          Name: "KFC",
                          ontap: () {
                            setState(() {
                              MenussizedBox = Home_Page_Bottom(
                                collectionname: "chicken_food",
                              );
                              OffersizedBox = OffersPage(collectionname:'chicken_offer');
                            });
                          }),
                      CategoryCardDesign(
                          Image: "assets/pizza.png",
                          Name: "pizza",
                          ontap: () {
                            setState(() {
                              MenussizedBox = Home_Page_Bottom(
                                collectionname: "Pizaa",
                              );
                              OffersizedBox = OffersPage(collectionname:'Pizza_offer');
                            });
                          }),
                      CategoryCardDesign(
                          Image: "assets/burger.png",
                          Name: "Burgers",
                          ontap: () {
                            setState(() {
                              MenussizedBox = Home_Page_Bottom(
                                collectionname: "Burgers",
                              );
                              OffersizedBox = OffersPage(collectionname:'Burgers_offers');
                            });
                          }),
                      CategoryCardDesign(
                          Image: "assets/Salad.png",
                          Name: "Salad",
                          ontap: () {
                            setState(() {
                              MenussizedBox = Home_Page_Bottom(
                                collectionname: "Salad",
                              );
                              OffersizedBox = OffersPage(collectionname:'Offer');
                            });
                          }),
                      CategoryCardDesign(
                          Image: "assets/cake.png",
                          Name: "Desserts",
                          ontap: () {
                            setState(() {
                              MenussizedBox = Home_Page_Bottom(
                                collectionname: "Desserts",
                              );
                              OffersizedBox = OffersPage(collectionname:'Offer');
                            });
                          }),
                      CategoryCardDesign(
                          Image: "assets/Juice.png",
                          Name: "Beverages",
                          ontap: () {
                            setState(() {
                              MenussizedBox = Home_Page_Bottom(
                                collectionname: "Juice",
                              );
                              OffersizedBox = OffersPage(collectionname:'Offer');
                            });
                          }),
                     
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child:  Text(
                      S.of(context).Special_for_you,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceDimenssions.deviceHeight * .25,
                  child: OffersizedBox
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child:  Text(
                      S.of(context).Menu+" 🔥",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: DeviceDimenssions.deviceHeight * .22,
                  child: MenussizedBox,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
