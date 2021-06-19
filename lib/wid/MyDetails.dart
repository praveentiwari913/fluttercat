import 'package:flutter/material.dart';
import 'package:flutter_application_1/Mytheme.dart';
import 'package:flutter_application_1/catlogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDetails extends StatelessWidget {
  //const MyDetails({Key? key}) : super(key: key);
  final Item catlog;

  const MyDetails({Key key, @required this.catlog})
      : assert(catlog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                tag: Key(catlog.id.toString()),
                child: Image.network(catlog.image).p16()),
            Expanded(
                child: VxArc(
              height: 25,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.brown.shade400,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catlog.name.text.xl2
                        .color(Mytheme.darkBluishColor)
                        .bold
                        .make(),
                    catlog.desc.text
                        .color(Colors.white38)
                        .lg
                        .textStyle(context.captionStyle)
                        .make(),
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
