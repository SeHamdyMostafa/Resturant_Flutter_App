import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurantapp/Checkout_Page/Checkout_Page.dart';
import 'package:restaurantapp/Device_Dimenssions.dart';
import 'package:restaurantapp/Verification/OptDilog.dart';
import 'package:restaurantapp/generated/l10n.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool _isHovered = false;
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  final String _staticOtp = '1598'; // Static OTP value

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Verification),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) =>  CheckoutPage()),
              (route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    image: const AssetImage('assets/otp.png'),
                    width: DeviceDimenssions.deviceWidth * .5),
                const SizedBox(height: 10),
                Text(
                  S.of(context).Verification_code,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).We_have_sent_a_verification_code_to_your,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  S.of(context).mobile_number,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myInputBox(context, txt1),
                    myInputBox(context, txt2),
                    myInputBox(context, txt3),
                    myInputBox(context, txt4),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).Haven_not_received_OTP_yet,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    resendTime == 0
                        ? InkWell(
                            onTap: () {
                              // Resend OTP Code
                              invalidOtp = false;
                              resendTime = 60;
                              startTimer();
                            },
                            child: Text(
                              S.of(context).Resend,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 18),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 10),
                resendTime != 0
                    ? Text(
                        S.of(context).You_can_resend_OTP_after +
                            ' ${strFormatting(resendTime)} ' +
                            S.of(context).second,
                        style: const TextStyle(fontSize: 14),
                      )
                    : const SizedBox(),
                const SizedBox(height: 5),
                Text(
                  invalidOtp ? S.of(context).Invalid_otp : '',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final otp = int.parse(
                        '${txt1.text}${txt2.text}${txt3.text}${txt4.text}');
                    if (otp == int.parse(_staticOtp)) {
                      // OTP verification successful, go to welcome page
                      stopTimer();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return  ConfirmationDialog();
                          });
                    } else {
                      // OTP verification failed, show an error message
                      setState(() {
                        invalidOtp = true;
                      });
                    }
                  },
                  child: Text(
                    S.of(context).Verify,
                    style: const TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: DeviceDimenssions.deviceWidth * .08,
                        vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 247, 157, 24))),
                    backgroundColor: _isHovered ? Colors.white : Colors.orange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 60,
    width: 50,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: TextField(
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 28),
      decoration: const InputDecoration(
        enabledBorder: InputBorder.none,
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}