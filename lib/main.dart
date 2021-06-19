import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Myroutes.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';
import 'themes.dart';
import 'CartPage.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Login(),
      themeMode: ThemeMode.light,

      theme: Mytheme.lightTheme(context),

      darkTheme: Mytheme.DarkTheme(context),

      initialRoute: Myroutes.Login,
      routes: {
        "/": (context) => Login(),
        Myroutes.Login: (context) => Login(),
        Myroutes.Home: (context) => HomePage(),
        Myroutes.Cart_Page: (context) => CartPage(),
      },
    );
  }
}
