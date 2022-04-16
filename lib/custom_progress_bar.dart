import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    Key? key,
    required this.width,
    required this.ratio,
  }) : super(key: key);

  final int width;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(5),
            child: AnimatedContainer(
              height: 5,
              width: width * ratio,
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: ratio < 0.3
                    ? Colors.red
                    : ratio < 0.6
                        ? Colors.amber
                        : Colors.lightGreen,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
