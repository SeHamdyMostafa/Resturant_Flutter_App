import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Favoriate_Page/Favoriate_Model.dart';

class Favorite_Card_Design extends StatelessWidget {
  Favorite_Card_Design({super.key, required this.favoriate_model});
  Favoriate_Model favoriate_model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: DeviceDimenssions.deviceHeight * .24,
        child: Container(
          height: DeviceDimenssions.deviceHeight * .24,
          width: DeviceDimenssions.deviceWidth * .9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 205, 205, 205),
                blurRadius: 8.0,
                spreadRadius: 4.0,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                child: Image.network(
                  favoriate_model.image,
                  width: DeviceDimenssions.deviceWidth * .28, // corrected spelling
                  height: DeviceDimenssions.deviceHeight * .14,
                ),
              ),
              Container(
                height: DeviceDimenssions.deviceHeight*.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoriate_model.Name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: DeviceDimenssions.deviceWidth * .6,
                        child: Text(
                          favoriate_model.description!,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${favoriate_model.price!} EGP",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
