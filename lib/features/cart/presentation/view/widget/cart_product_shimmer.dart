import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';

class CartProductShimmer extends StatelessWidget {
  const CartProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.white,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const SizedBox(height: 140),
        ),
      ),
    );
  }
}
