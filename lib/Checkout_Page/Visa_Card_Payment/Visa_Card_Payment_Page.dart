import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Checkout_Page/Visa_Card_Payment/Visa_Card_Payment_TextField.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/showSnackBar.dart';

class Visa_Card_Payment extends StatefulWidget {
  @override
  _Visa_Card_PaymentState createState() => _Visa_Card_PaymentState();
}

class _Visa_Card_PaymentState extends State<Visa_Card_Payment> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _isHovered=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).Checkout),
      ),
      body: Column(
        children: [
          // Visa card image in the header
          Container(
            width: DeviceDimenssions.deviceWidth*.8,
            height: DeviceDimenssions.deviceHeight * .25,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/card.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 16.0),
          // Form fields
          Form(
            key: _formKey,
            child: Column(
              children: [
                Visa_Card_PaymentTextField(
                  controller: _cardNameController,
                  label: S.of(context).Card_Number,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).Please_enter_your_card_number;
                    }
                    return null;
                  },
                ),
                Visa_Card_PaymentTextField(
                  controller: _cardNameController,
                  label: S.of(context).Name,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).Please_enter_your_Name;
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Container(
                      width: DeviceDimenssions.deviceWidth * .5,
                      child: Visa_Card_PaymentTextField(
                        controller: _expiryDateController,
                        label: S.of(context).Expiry_Date,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).Please_enter_the_expiry_date;
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: DeviceDimenssions.deviceWidth * .5,
                      child: Visa_Card_PaymentTextField(
                        controller: _cvvController,
                        label: S.of(context).CVV,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).Please_enter_your_CVV;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  await FirebaseFirestore.instance.collection('User_Info').add({
                    'cardNumber': _cardNumberController.text,
                    'cardName': _cardNameController.text,
                    'expiryDate': _expiryDateController.text,
                    'cvv': _cvvController.text,
                  });
                  // Show a success message or navigate to a different screen
                  
                } catch (e) {
                  // Handle any errors that occurred during the save operation
                  showSnackBar(context,S.of(context).Error_saving_payment_information);
              
                }
              }
            },
            style: ElevatedButton.styleFrom(
                padding:  EdgeInsets.symmetric(horizontal: DeviceDimenssions.deviceWidth*.16,vertical: 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2, color: Colors.orange)),
                backgroundColor: _isHovered ? Colors.white : const Color.fromARGB(255, 247, 157, 24),
                foregroundColor: Colors.white,
                elevation: 0,
              ),
            child: Text(S.of(context).Pay_now,style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
