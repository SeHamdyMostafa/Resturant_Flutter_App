import 'package:flutter/material.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/call_us_option.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/chat_option.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/contact_us_page_header.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/email_us_option.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/message_text_field.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/or_divider_line.dart';
import 'package:restaurantapp/contact_us_page/contact_us_page_components/send_message_button.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          height: DeviceDimenssions.deviceHeight, 
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ContactUsPageHeader(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [CallUsOption(), EmailUsOption(), ChatOption()],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OrDividerLine(),
                Container(
                  alignment: Alignment.center,
                  height: 350,
                  width: DeviceDimenssions.deviceWidth,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      MessageTextField(),
                      SendMessageButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
