import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';

class CartDetailsCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const CartDetailsCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 90,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingSize.s10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ColorsManager.darkWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingSize.s10),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 200,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: StyleManager.title2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subTitle,
                    style: StyleManager.subtitle,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: ColorsManager.darkWhite,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.green,
                  width: 1.0,
                )),
            child: const Icon(
              FontAwesomeIcons.check,
              size: 15,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
