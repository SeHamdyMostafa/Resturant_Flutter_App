import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';

class Profile_Header extends StatelessWidget{
  Profile_Header({super.key,required this.name,required this.email});
  String name;
  String email;

  @override
  Widget build(BuildContext context){
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: DeviceDimenssions.deviceHeight * .22,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 20,
                        child: Container(
                          width: DeviceDimenssions.deviceWidth * .9,
                          height: DeviceDimenssions.deviceHeight * .16,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 205, 205, 205),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage("assets/myphoto.jpg"),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              email,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}