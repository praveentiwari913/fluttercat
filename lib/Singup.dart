import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  // SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "";
  bool change = false;
  final _formkey = GlobalKey<FormState>();
  @override
  move(BuildContext context) {
    if (_formkey.currentState.validate() == true) {
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: AppBar(),
        ),
        body:
            // color: Colors.white,
            SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.fromLTRB(0, 30, 10, 30),
            elevation: 30,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "Assets/images/undraw_Profile_re_4a55.png",
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 35,

                        //  decorationThickness: 10,
                        color: Colors.deepPurple,
                        fontFamily: GoogleFonts.slabo27px().fontFamily),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              labelText: "Email",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Email";
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
                          TextFormField(
                            //obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              labelText: "Name",
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter Name";
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
                      onTap: () => move(context),
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
                                "SignUp",
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
