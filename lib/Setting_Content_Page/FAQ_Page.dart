import 'package:flutter/material.dart';
import 'package:restaurantapp/generated/l10n.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
 

  bool _isExpanded = false;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {

     List<String> questions = [
    S.of(context).Question_1,
    S.of(context).Question_2,
    S.of(context).Question_3,
    S.of(context).Question_4,
    S.of(context).Question_5,
    S.of(context).Question_6,
    S.of(context).Question_7,
    S.of(context).Question_8,
    S.of(context).Question_9,
    S.of(context).Question_10,
  ];

  List<String> answers = [
    S.of(context).Answer_1,
    S.of(context).Answer_2,
    S.of(context).Answer_3,
    S.of(context).Answer_4,
    S.of(context).Answer_5,
    S.of(context).Answer_6,
    S.of(context).Answer_7,
    S.of(context).Answer_8,
    S.of(context).Answer_9,
    S.of(context).Asnwer_10
     ];

    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.separated(
        itemCount: questions.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ExpansionTile(
            shape:BeveledRectangleBorder(),
            title: Text(questions[index]),
            trailing: Icon(
              _selectedIndex == index && _isExpanded
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(answers[index]),
              ),
            ],
            onExpansionChanged: (expanded) {
              setState(() {
                _isExpanded = expanded;
                _selectedIndex = expanded ? index : -1;
              });
            },
          );
        },
      ),
    );
  }
}