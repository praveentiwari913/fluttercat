import 'package:flutter/material.dart';
import 'package:flutter_application_1/Myroutes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Myroutes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool change = false;
  bool change2 = false;
  final _formkey = GlobalKey<FormState>();

  movetoS(BuildContext context) async {
    change2 = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    await Navigator.pushNamed(context, Myroutes.Signup);
    setState(() {
      change2 = false;
    });
  }

  movetoHome(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      change = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 2));

      await Navigator.pushNamed(context, Myroutes.Home);
      setState(() {
        change = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
            elevation: 30,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "Assets/images/undraw_authentication_fsn5.png",
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome Sir",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontFamily: GoogleFonts.lato().fontFamily),
                  ),
                  SizedBox(
                    height: 25,
                    child: Text(
                      " $name",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Username",
                              labelText: "Username",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter username";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              name = "@" + value;
                              setState(() {});
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () => movetoHome(context),
                          child: AnimatedContainer(
                            //  margin: EdgeInsetsGeometry.lerp(),
                            duration: Duration(seconds: 1),
                            height: 40,
                            width: change ? 40 : 100,
                            alignment: Alignment.center,
                            child: change
                                ? Icon(
                                    Icons.done_all,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                            //   padding: EdgeInsets.all(100),
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.circular(change ? 70 : 10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Material(
                        child: InkWell(
                          onTap: () => movetoS(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 40,
                            width: change2 ? 40 : 100,
                            alignment: Alignment.center,
                            child: change2
                                ? Icon(
                                    Icons.airplay_rounded,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "SignUp",
                                    style: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                              color: change2
                                  ? Colors.deepPurpleAccent
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.circular(change2 ? 70 : 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
