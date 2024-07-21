import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/generated/l10n.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            minimumSize: MaterialStateProperty.all(const Size(130, 40)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(S.of(context).Send, style: TextStyle(fontSize: 18)),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_forward,
                size: 22.0,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
