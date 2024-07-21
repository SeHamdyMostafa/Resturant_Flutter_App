import 'package:flutter/material.dart';
import 'package:restaurantapp/Checkout_Page/Visa_Card_Payment/Visa_Card_Payment_Page.dart';
import 'package:restaurantapp/generated/l10n.dart';
enum SingingCharacter { card, cash }
class PaymentMethod  extends StatefulWidget {
  final Function onCardSelected;

   PaymentMethod 
  ({required this.onCardSelected}) ;

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod > {
    SingingCharacter? selectedOption;

  void CardIsSelected() {
    if (selectedOption == SingingCharacter.card) {
      widget.onCardSelected(selectedOption);
    }
    if (selectedOption == SingingCharacter.cash) {
      widget.onCardSelected(selectedOption);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = SingingCharacter.card;
                  });
                  CardIsSelected();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Visa_Card_Payment();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      leading: Icon(Icons.add),
                      title: Text(S.of(context).Add_a_new_card),
                      trailing: Radio<SingingCharacter>(
                        value: SingingCharacter.card,
                        groupValue: selectedOption,
                        activeColor: Colors.orange,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            selectedOption = value!;
                            CardIsSelected();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Visa_Card_Payment();
                            }));
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOption = SingingCharacter.cash;
                      CardIsSelected();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: .5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text(S.of(context).Cash),
                      trailing: Radio<SingingCharacter>(
                        value: SingingCharacter.cash,
                        groupValue: selectedOption,
                        activeColor: Colors.orange,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            selectedOption = value!;
                            CardIsSelected();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}


