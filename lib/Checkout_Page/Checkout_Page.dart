import 'package:flutter/material.dart';
import 'package:restaurantapp/Address_Page/map_page.dart';
import 'package:restaurantapp/Battom_NavBar.dart';
import 'package:restaurantapp/Cart_Page/Order_Summary/Order_Summary_Builder.dart';
import 'package:restaurantapp/Checkout_Page/Cash_Payment/MyDialog.dart';
import 'package:restaurantapp/Checkout_Page/Payment_Method.dart';
import 'package:restaurantapp/Checkout_Page/Cash_Payment/MyCheckboxListTile.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Checkout_Page/Visa_Card_Payment/Visa_Card_Payment_Page.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/showSnackBar.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  SingingCharacter? _selectedOption;
  String _address = '';
  bool _isHovered = false;
  bool checkboxValue = false;

  void onCardSelected(SingingCharacter? option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(S.of(context).Checkout),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
          
        },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              map_page(
                  onAddressChanged: (address) {
                    setState(() {
                      _address = address;
                    });
                  },
                  address: _address),
              const SizedBox(height: 16.0),
               Text(
                S.of(context).Pay_with,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              // Add a new card button
              PaymentMethod(
                onCardSelected: onCardSelected,
              ),
              SizedBox(height: DeviceDimenssions.deviceHeight * .01),
              SizedBox(
                height: DeviceDimenssions.deviceHeight * .275,
                child:  Order_Summary_Builder(sizedBox: SizedBox(),),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedOption == SingingCharacter.card) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Visa_Card_Payment(),
                        ),
                      );
                    } else if (_selectedOption == SingingCharacter.cash) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MyDialog();
                        },
                      );
                    } else {
                      showSnackBar(context, S.of(context).Please_select_payment_method);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: DeviceDimenssions.deviceWidth * .20,
                        vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(width: 2, color: Colors.orange)),
                    backgroundColor: _isHovered
                        ? Colors.white
                        : const Color.fromARGB(255, 247, 157, 24),
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child:  Text(
                    S.of(context).Place_order,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
