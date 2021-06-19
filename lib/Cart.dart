import 'package:flutter/material.dart';
import 'package:flutter_application_1/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catlogModel.dart';

class CartModel {
  CatalogModel _catlog;

  final List<int> _itemsId = [];

  CatalogModel get catlog => _catlog;

  set catlog(CatalogModel newcatlog) {
    assert(newcatlog != null);
    _catlog = newcatlog;
  }

  List<Item> get items => _itemsId.map((id) => _catlog.getById(id)).toList();

  num get Price => items.fold(0, (total, current) => total + current.price);

  void remove(Item items) {
    _itemsId.remove(items.id);
  }
}

class AddMutaion extends VxMutation<MyStore> {
  final Item item;

  AddMutaion(this.item);

  perform() {
    store.cart._itemsId.add(item.id);
  }
}

class RemoveMutaion extends VxMutation<MyStore> {
  final Item item;

  RemoveMutaion(this.item);

  perform() {
    store.cart._itemsId.remove(item.id);
  }
}
