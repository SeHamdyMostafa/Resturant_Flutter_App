import 'package:flutter/material.dart';
import 'package:restaurantapp/Register_Page/Register_Page.dart';
import 'package:restaurantapp/StartPages/StartPage_Design.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/SplashPage/SplashPage.dart';
import 'package:restaurantapp/generated/l10n.dart';

class Start_Pages_View extends StatefulWidget {
  const Start_Pages_View({Key? key}) : super(key: key);

  @override
  State<Start_Pages_View> createState() => _Start_Pages_ViewState();
}

class _Start_Pages_ViewState extends State<Start_Pages_View> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      StartPage_Design(
        headertext: S.of(context).Choose_A_Tasty_Dish,
        subtext: S.of(context).Order_anything_you_want_and_it_will,
        subtext2: S.of(context).be_delivered_to_your_doorstep,
        subtext3: "",
        image: 'assets/Frites.png',
      ),
      StartPage_Design(
        headertext: S.of(context).Easy_Payment,
        subtext: S.of(context).debit_card_credit_more_ways,
        subtext2: S.of(context).to_pay_for_your_food,
        subtext3: "",
        image: 'assets/Wallet.png',
      ),
      StartPage_Design(
        headertext: S.of(context).Payment_made_easy_through,
        subtext: S.of(context).Healthy_eating_means_eating_a,
        subtext2: S.of(context).variety_of_foods_that_give_you,
        subtext3: S.of(context).the_nutrients_you_need_to,
        image: 'assets/5787016.png',
      ),
    ];

    void navigateToNextPage() {
      if (_activePage < _pages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterPage(),
          ),
          (_) => false,
        );
      }
    }

    DeviceDimenssions.init(c: context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Splash_template.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _activePage = page;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _pages[index % _pages.length];
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: DeviceDimenssions.deviceHeight * .6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor:
                          _activePage == index ? Colors.amber : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: DeviceDimenssions.deviceHeight * .2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      navigateToNextPage();
                    });
                  },
                  child: Text(S.of(context).Next),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                      (_) => false,
                    );
                  },
                  child: Text(S.of(context).Skip),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}