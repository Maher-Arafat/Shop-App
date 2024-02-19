import 'package:flutter/material.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SizedBox(
                  height: 50,
                  width: 115,
                ),
              )),
    );
  }
}
