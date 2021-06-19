import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_application_1/Myroutes.dart';
import 'package:flutter_application_1/Mytheme.dart';
import 'package:flutter_application_1/addtocart.dart';
import 'package:flutter_application_1/wid/MyDetails.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Items.dart';
import 'package:flutter_application_1/catlogModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Myroutes.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Myroutes.Cart_Page),
          backgroundColor: Mytheme.darkBluishColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyHeader(),
                (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                    ? MyL().expand()
                    : CircularProgressIndicator().centered().p16().expand(),
              ],
            ),
          ),
        ));
  }
}

class MyL extends StatelessWidget {
  //const Buil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catlog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyDetails(catlog: catlog))),
            child: CatlogIt(catlog: catlog));
      },
    );
  }
}

class CatlogIt extends StatelessWidget {
  final Item catlog;

  const CatlogIt({Key key, @required this.catlog})
      : assert(catlog != null),
        super(key: key);

  //const CatlogIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catlog.id.toString()),
            child: CatalogImage(
              image: catlog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catlog.name.text.lg.color(Mytheme.darkBluishColor).bold.make(),
              catlog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catlog.price}".text.bold.xl.make(),
                  /* ElevatedButton(
                    onPressed: () {
                      () => Navigator.pushNamed(context, Myroutes.Cart_Page);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Mytheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  )*/
                  AddToCart(
                    catalog: catlog,
                  ),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
    ;
  }
}

class MyHeader extends StatelessWidget {
  //const MyHeader({Key? key}) : super//(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App"
            .text
            .color(Mytheme.darkBluishColor)
            .xl5
            .bold
            .fontFamily(GoogleFonts.poppins().fontFamily)
            .make(),
        "Products ALLies"
            .text
            .fontFamily(GoogleFonts.poppins().fontFamily)
            .xl2
            .color(Colors.black)
            .make(),
      ],
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(Mytheme.creamColor).make().p16().w40(context);
  }
}
