import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/style.dart';

class OrderInfoCard extends StatelessWidget {
  final String title;
  final String price;

  const OrderInfoCard({
    super.key,
    required this.title,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: StyleManager.subtitle),
        const Spacer(),
        Text('$price \$', style: StyleManager.title1),
      ],
    );
  }
}
