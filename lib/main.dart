import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cahehelper.dart';

import 'package:flutter_application_1/screens/splachscreen.dart';

import 'blocobservable.dart';

Future <void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await cachehelper.init();



  runApp( MyApp());}

MaterialColor myPrimarySwatch = MaterialColor(
  0xFFFC9B00, // Replace with your primary color value
  <int, Color>{
    50: Color(0xFFFC9B00), // Replace with shade colors as needed
    100: Color(0xFFD28201),
    200: Color(0xFFD28201),
    300: Color(0xFFD28201),
    400: Color(0xFFD28201),
    500: Color(0xFFD28201), // This is the primary color
    600: Color(0xFFD28201),
    700: Color(0xFFD28201),
    800: Color(0xFFD28201),
    900: Color(0xFFD28201),
  },
);

class MyApp extends StatelessWidget {

  MyApp();




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myPrimarySwatch,

       
      ),

      home:splaccscreen(),



    );
  }
}

