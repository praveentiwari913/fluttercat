/*import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Items.dart';
import 'package:flutter_application_1/catlogModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'MyDrawer.dart';
import 'MyList.dart';

class HomePage extends StatefulWidget {
  //const name({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Load();
    //Future.delayed(2);
  }

  Load() async {
    await Future.delayed(Duration(seconds: 2));
    final catloglist = await rootBundle.loadString("Assets/files/catlog.json");
    var catlogjson = jsonDecode(catloglist);
    var productdata = catlogjson["products"];
    CatalogModel.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    //print(CatalogModel.items[0]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          widthFactor: 1,
          child: Text(
            "CatlogApp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: GoogleFonts.monoton().fontFamily, fontSize: 25),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: (CatalogModel.items == null)
            ? Center(
                child: CircularProgressIndicator(
                // semanticsLabel: "Just a sec",

                backgroundColor: Colors.black,
              ))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: CatalogModel.items.length,
                // padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: GridTile(
                      header: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.blueAccent,
                        child: Text(
                          CatalogModel.items[index].name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Image.network(CatalogModel.items[index].image),
                      footer: Container(
                          color: Colors.lime,
                          child:
                              Text(CatalogModel.items[index].price.toString())),
                    ),
                  );
                }),
      ),
    );
  }
}*/
