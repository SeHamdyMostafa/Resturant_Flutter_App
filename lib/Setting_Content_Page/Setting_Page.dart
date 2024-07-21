import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Address_Page/Adress_Page.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/Change_Email_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/Change_Password_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/FAQ_Page.dart';
import 'package:restaurantapp/Setting_Content_Page/Language_Option.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Card_Design.dart';
import 'package:restaurantapp/Setting_Content_Page/Setting_Page_Model.dart';
import 'package:restaurantapp/contact_us_page/contact.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Setting_Page extends StatelessWidget {
  Setting_Page({super.key,});
 

  @override
  Widget build(BuildContext context) {
     List<Setting_Page_Model> SettingList = [
    Setting_Page_Model(
      text: S.of(context).Saved_Address,
      Page: Address_Page(),
      icon: Icons.arrow_forward_ios,
      leadingIcon: Icons.location_on_outlined,
    ),
    Setting_Page_Model(
      text: S.of(context).Change_email,
      Page: Change_Email_Page(),
      icon: Icons.arrow_forward_ios,
      leadingIcon: Icons.email_outlined,
    ),
    Setting_Page_Model(
      text: S.of(context).Change_password,
      Page: Change_Password_page(),
      icon: Icons.arrow_forward_ios,
      leadingIcon: Icons.lock_outline,
    ),
    Setting_Page_Model(
      text: S.of(context).FAQ_Help,
      Page: FAQPage(),
      icon: Icons.arrow_forward_ios,
      leadingIcon: Icons.help_outline,
    ),
    Setting_Page_Model(
      text: S.of(context).Contact_with_us,
      Page: ContactPage(),
      icon: Icons.arrow_forward_ios,
      leadingIcon: Icons.contact_page_outlined,
    ),
    Setting_Page_Model(
        text: S.of(context).Country,
        Page: Page,
        icon: Icons.arrow_forward_ios,
        leadingIcon: Icons.public_outlined),
    Setting_Page_Model(
      text: S.of(context).App_feedback,
      Page: Page,
      icon: Icons.arrow_forward_ios,
      leadingIcon: Icons.star_border_outlined,
    ),
  ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).Settings,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Personal_Details,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: Column(
                  children: [
                    Setting_Card_Design(setting_page_model: SettingList[0]),
                    Setting_Card_Design(setting_page_model: SettingList[1]),
                    Setting_Card_Design(setting_page_model: SettingList[2]),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).Support,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: Column(
                  children: [
                    Setting_Card_Design(setting_page_model: SettingList[3]),
                    Setting_Card_Design(setting_page_model: SettingList[4]),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).More,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: Column(
                  children: [
                    Setting_Card_Design(setting_page_model: SettingList[5]),
                    LanguageAnimatedToggle(
                      values: ['English', 'العربية'],
                      onToggleCallback: (value) {
                        print('Toggled to $value');
                      },
                    ),
                    Setting_Card_Design(setting_page_model: SettingList[6]),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 1, color: Colors.orange)),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    textStyle: TextStyle(fontSize: 12),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }),
                      (route) => false,
                    );
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    size: 14,
                  ),
                  label: Text(
                    S.of(context).Logout,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
