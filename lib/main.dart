import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:restaurantapp/StartPages/Srart_Pages_View.dart';
import 'package:restaurantapp/SplashPage/SplashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurantapp/generated/l10n.dart';
import 'package:restaurantapp/healper/Provider.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();

  runApp(
    ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: MyApp(),
    ),
    
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyProvider _provider;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _provider = MyProvider();
    _currentIndex = _provider.locale == const Locale('en') ? 0 : 1;
    _provider.initLocale();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _provider,
      child: Consumer<MyProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            locale: provider.locale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

            
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return const Start_Pages_View();
                }
                return SplashPage();
              },
            ),
          );
        },
      ),
    );
  }
}
