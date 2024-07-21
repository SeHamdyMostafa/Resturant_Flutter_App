import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class GenderSelection extends StatefulWidget {
  GenderSelection({Key?key ,required this.selectedOption });
    String? selectedOption;

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              activeColor: Colors.orange,
              groupValue: widget.selectedOption,
              onChanged: (String? value) {
                setState(() {
                  widget.selectedOption = value!;
                });
              },
            ),
             Text(S.of(context).Male),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Female',
              groupValue: widget.selectedOption,
              activeColor: Colors.orange,
              onChanged: (String? value) {
                setState(() {
                 widget.selectedOption = value!;
                });
              },
            ),
             Text(S.of(context).Female),
          ],
        )
      ],
    );
  }
}
