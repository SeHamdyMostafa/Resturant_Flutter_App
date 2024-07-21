import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';


class CheckboxListTileExample extends StatefulWidget {
   CheckboxListTileExample({super.key,required this.checkboxValue1,required this.onChanged});
   bool checkboxValue1;
   final Function(bool?) onChanged;

  @override
  State<CheckboxListTileExample> createState() =>
      _CheckboxListTileExampleState();
}

class _CheckboxListTileExampleState extends State<CheckboxListTileExample> {
 


  @override
  Widget build(BuildContext context) {
    return  CheckboxListTile(
      value: widget.checkboxValue1,
      onChanged: widget.onChanged,
      title:  Text(S.of(context).Send_SMS),
    );
  }
}
