import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:product_card/custom_progress_bar.dart';

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String name;
  final int price;
  final int quantity;
  final int stock;
  final int width;
  final String? notification;
  final Function() addToCart;
  final Function() incrementTap;
  final Function() decrementTap;

  final TextStyle textStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.grey[800],
  );

  ProductCard({
    Key? key,
    this.imageURL = '',
    this.name = '',
    this.price = 0,
    this.quantity = 0,
    this.stock = 10,
    this.width = 140,
    this.notification,
    required this.addToCart,
    required this.incrementTap,
    required this.decrementTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = stock / 10;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Card',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                AnimatedContainer(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.only(bottom: 8),
                  height: notification != null ? 310 : 260,
                  width: 130,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: const Offset(1, 1),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Colors.green,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      notification != null ? notification! : '',
                      style: textStyle.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              image: DecorationImage(
                                image: AssetImage(imageURL),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              name,
                              style: textStyle,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0,
                              ).format(price),
                              style: textStyle.copyWith(
                                fontSize: 12,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.all_inbox_rounded,
                                  size: 14,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "$stock/10 pcs",
                                  style: textStyle.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomProgressBar(
                            width: width,
                            ratio: ratio,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.lightBlue,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: incrementTap,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.lightBlue,
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  quantity.toString(),
                                  style: textStyle,
                                ),
                                GestureDetector(
                                  onTap: decrementTap,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.lightBlue,
                                    child: const Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              bottom: 5,
                            ),
                            child: ElevatedButton(
                              onPressed: addToCart,
                              child: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 18,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                primary: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
