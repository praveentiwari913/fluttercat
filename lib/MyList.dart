import 'package:flutter/material.dart';
import 'catlogModel.dart';

class MyList extends StatelessWidget {
  // const name({Key key}) : super(key: key);
  final Item items;

  const MyList({Key key, @required this.items})
      : assert(items != null),
        super(key: key);
//const MyList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(items.image),
        title: Text(items.name),
        subtitle: Text(items.desc),
      ),
    );
  }
}
