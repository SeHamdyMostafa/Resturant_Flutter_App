import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Personal_Details extends StatelessWidget{
  Personal_Details({super.key,required this.phone,required this.gender,required this.pirthdate});
  String phone;
  String gender;
  String pirthdate;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
         Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      S.of(context).Personal_Details,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone_android,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "+20 ${phone}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.transgender,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      gender == 'Male'
    ? S.of(context).Male
    : S.of(context).Female,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                     pirthdate,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 5,
                color: Colors.orange,
                thickness: .5,
              ),
      ],
    );
  }
}