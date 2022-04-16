import 'package:flutter/material.dart';
import 'package:product_card/product_card.dart';
import 'package:product_card/product_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductState>(
      create: (context) => ProductState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<ProductState>(
          builder: (context, value, _) => ProductCard(
            imageURL: 'assets/mixed-fruits.jpg',
            name: 'Buah-buahan Mix 1 kg',
            price: 25000,
            quantity: value.quantity,
            stock: value.stock,
            notification: value.quantity > 5 ? 'Diskon 10%' : null,
            addToCart: () {},
            incrementTap: () {
              if (value.quantity < 10 && value.stock > 0) {
                value.quantity++;
                value.stock--;
              }
            },
            decrementTap: () {
              if (value.quantity > 0) {
                value.quantity--;
                value.stock++;
              }
            },
          ),
        ),
      ),
    );
  }
}
