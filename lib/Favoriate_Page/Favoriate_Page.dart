import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Favoriate_Page/Empty_Favorite.dart';
import 'package:restaurantapp/Favoriate_Page/Favoriate_Model.dart';
import 'package:restaurantapp/Favoriate_Page/Favorite_Card_Design.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Favoriate_Page extends StatefulWidget {
  const Favoriate_Page({Key? key}) : super(key: key);

  @override
  State<Favoriate_Page> createState() => _Favoriate_PageState();
}

class _Favoriate_PageState extends State<Favoriate_Page> {
  late Future<QuerySnapshot> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = _fetchFavorites();
  }

  Future<QuerySnapshot> _fetchFavorites() async {
    final user = FirebaseAuth.instance.currentUser;
    String? email = user!.email;
     if (email != null) {
    final userFavorites = await FirebaseFirestore.instance
        .collection('UserFavoriate')
        .where('UserEmail', isEqualTo: email)
        .get();
    return userFavorites;
  } else {
      throw Exception("User email not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar:  AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:   Text(S.of(context).Favorites,style: TextStyle(fontSize: 24),)),
      body: FutureBuilder<QuerySnapshot>(
        future: _favoritesFuture,
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
            List<Favoriate_Model> favoritesList = [];
            for (var item in snapshot.data!.docs) {
              Favoriate_Model favoriate_model = Favoriate_Model(
                Name: item['ProductName'],
                description: item['ProductDescription'],
                price: item['ProductPrice'],
                image: item['ProductImage'],
              );
              favoritesList.add(favoriate_model);
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favoritesList.length,
              itemBuilder: (context, index) {
                return Favorite_Card_Design(
                  favoriate_model: favoritesList[index],
                );
              },
            );
          } else {
            return Empty_Favorite();
          }
        },
      ),
    );
  }
}