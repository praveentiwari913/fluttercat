import 'package:velocity_x/velocity_x.dart';

import 'Cart.dart';
import 'catlogModel.dart';

class MyStore extends VxStore {
  CatalogModel catlog;
  CartModel cart;
  MyStore() {
    catlog = CatalogModel();
    cart = CartModel();
    cart.catlog = catlog;
  }
}
