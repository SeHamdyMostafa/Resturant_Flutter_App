import 'package:flutter/material.dart';
import 'package:restaurantapp/Account_Page/Profile/Personal_Details.dart';
import 'package:restaurantapp/Account_Page/Profile/ProfileModel.dart';
import 'package:restaurantapp/Account_Page/Profile/Profile_Header.dart';
import 'package:restaurantapp/Account_Page/Profile/Profile_buttom.dart';
import 'package:restaurantapp/Address_Page/Adress_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Profile extends StatelessWidget {
  Profile({super.key, required this.profileModel});
  ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Profile_Header(name: profileModel.name,email: profileModel.email,),
              Personal_Details(phone: '${profileModel.phone}',gender: profileModel.gender,pirthdate:  profileModel.pirthdate,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      S.of(context).Address,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return  Address_Page();
                        }));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      color: Colors.orange,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: DeviceDimenssions.deviceWidth * .75,
                      child: Text(
                        profileModel.Address,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
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
              const SizedBox(
                height: 10,
              ),
              Profile_Buttom(profileModel:profileModel)
            ],
          ),
        ),
      ),
    );
  }
}
