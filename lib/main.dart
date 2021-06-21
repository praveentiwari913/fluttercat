import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Myroutes.dart';
import 'package:flutter_application_1/Singup.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'store.dart';
import 'themes.dart';
import 'CartPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // await Firebase.initializeApp();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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
              Myroutes.Signup: (context) => SignUp(),
            },
          );
          ;
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
