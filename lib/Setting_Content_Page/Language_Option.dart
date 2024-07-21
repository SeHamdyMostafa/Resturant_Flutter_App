import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/Provider.dart';

class LanguageAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged<String> onToggleCallback;

  LanguageAnimatedToggle({required this.values, required this.onToggleCallback});

  @override
  _LanguageAnimatedToggleState createState() => _LanguageAnimatedToggleState();
}

class _LanguageAnimatedToggleState extends State<LanguageAnimatedToggle> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex =
        context.read<MyProvider>().locale == const Locale('en') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.language,
                size: 18,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                S.of(context).language,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = (_currentIndex + 1) % widget.values.length;
                
              });

              if (_currentIndex == 0) {
                // English is selected
                context.read<MyProvider>().setLocale(const Locale('en'));
              } else {
                // Arabic is selected
                context.read<MyProvider>().setLocale(const Locale('ar'));
              }
            },
            child: Container(
              width: DeviceDimenssions.deviceWidth * .3,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left: _currentIndex * 50,
                    child: Container(
                      width: DeviceDimenssions.deviceWidth * .18,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.values[_currentIndex],
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}