import 'package:flutter/material.dart';
import 'package:restaurantapp/Account_Page/Edit_Profile/Edit_Profile_Page.dart';
import 'package:restaurantapp/Account_Page/Profile/ProfileModel.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Profile_Buttom extends StatelessWidget{
  Profile_Buttom({super.key,required this.profileModel});
  ProfileModel profileModel;

@override
  Widget build(BuildContext context){
    return Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Edit_Profile(
                        profileModel: profileModel,
                      );
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: DeviceDimenssions.deviceHeight * .08,
                    width: DeviceDimenssions.deviceWidth * .6,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.orange),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child:  Text(S.of(context).Edit_Profile),
                  ),
                ),
              );
  }
  
}