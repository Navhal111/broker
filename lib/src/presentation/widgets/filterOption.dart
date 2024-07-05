import 'package:broker/src/domain/entity/utils/style.dart';
import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  final String image;
  final String title;

  const FilterOptions({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          Image.asset(image, height: 20),
          Text("     ${title}", style: poppinsSemiBold.copyWith())
        ],
      ),
    );
  }
}