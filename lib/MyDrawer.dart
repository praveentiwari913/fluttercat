import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  // const name({Key key}) : super(key: key);
  final imageurl = "https://unsplash.com/photos/p0B7ueoZz8E";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        // padding: EdgeInsets.zero,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Ramu KAKA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: GoogleFonts.lato().fontFamily),
                ),
                accountEmail: Text(
                  "Ramukaa@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1590086782957-93c06ef21604?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.collections, color: Colors.white),
              title: Text(
                "Practice",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.news, color: Colors.white),
              title: Text(
                "Articles",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text(
                "Emails",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
