import 'package:eco_mart/models/product_model.dart';
import 'package:eco_mart/models/store_model.dart';

class AppUtils {
  static List<StoreModel> list = [
    StoreModel(text: 'Frelyn\'s Store', image: 'assets/images/FRELYN.png'),
    StoreModel(text: 'CarMart', image: 'assets/images/carmart.png'),
    StoreModel(text: 'Andrei\'s Store', image: 'assets/images/andr.png'),
    StoreModel(text: 'SM\'s Store', image: 'assets/images/SM.jpg'),
    StoreModel(text: 'Asean SuperMarket', image: 'assets/images/Asean.png'),
    StoreModel(text: '456 supermarket', image: 'assets/images/456.jpg'),
  ];

  static List<ProductModel> productList = [
    ProductModel(
        image: 'assets/images/pusit.png', title: 'Squid', price: 'p220'),
    ProductModel(image: 'assets/images/beef.png', title: 'Beef', price: 'p380'),
    ProductModel(
        image: 'assets/images/chiken.png', title: 'Chicken', price: 'p180'),
    ProductModel(image: 'assets/images/pork.png', title: 'Pork', price: 'p420'),
    ProductModel(
        image: 'assets/images/pusit.png', title: 'Squid', price: 'p220'),
    ProductModel(image: 'assets/images/beef.png', title: 'Beef', price: 'p380'),
    ProductModel(
        image: 'assets/images/chiken.png', title: 'Chicken', price: 'p180'),
    ProductModel(image: 'assets/images/pork.png', title: 'Pork', price: 'p420'),
  ];
}
