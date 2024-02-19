import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';

class BrandContainer extends StatelessWidget {
  final CategoryDataModel categoryDataModel;

  const BrandContainer({
    Key? key,
    required this.categoryDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        RouterPath.brandView,
        extra: categoryDataModel,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.darkWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.s5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  categoryDataModel.image!,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error_outline_outlined),
                ),
              ),
              const SizedBox(width: AppSize.s5),
              Padding(
                padding: const EdgeInsets.all(PaddingSize.s5),
                child: Text(
                  categoryDataModel.name!,
                  style: StyleManager.title1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
