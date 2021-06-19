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
  final _formkey = GlobalKey<FormState>();

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
                  Material(
                    child: InkWell(
                      onTap: () => movetoHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 40,
                        width: change ? 40 : 100,
                        alignment: Alignment.center,
                        child: change
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(change ? 70 : 10),
                        ),
                      ),
                    ),
                  ),
                  /*  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Myroutes.Home);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),*/
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
