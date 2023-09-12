import 'package:flutter/material.dart';
import 'package:flutter_application_1/constantas/componets.dart';
import 'package:flutter_application_1/screens/homescreen/homescreen.dart';
import 'loginscreen/loginscreen.dart';
import 'package:flutter_application_1/cahehelper.dart';

class splaccscreen extends StatefulWidget {
  @override
  State<splaccscreen> createState() => _splaccscreenState();
}

class _splaccscreenState extends State<splaccscreen> {
  @override

  void initState() {
    naviagetafterthreesecond   ();
    super.initState();
  }

  void naviagetafterthreesecond (){
    Future.delayed(Duration(seconds: 3),).then((value)  {
      var token = cachehelper.getdata(key: "token");
      print(token);
      if (token != null) {
        naviagtefinsh(context, homescreen());

      } else {
        naviagtefinsh(context, Logincsreen());

      }

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 812,
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFFA9A0C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/image 47.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,

            ),
            Text(
              'Chef App',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 36,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
