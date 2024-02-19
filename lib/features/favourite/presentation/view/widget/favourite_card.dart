import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/utils/app_router.dart';
import 'package:yallanshop/core/widgets/custom_network_Image.dart';
import 'package:yallanshop/features/favourite/data/model/favourite_model.dart';

class FavouriteCard extends StatelessWidget {
  final FavouriteDataModel productModel;

  const FavouriteCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        RouterPath.detailsView,
        extra: productModel,
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width - 40,
        height: 140,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.darkWhite,
              blurRadius: 5,
              offset: const Offset(0, 3),
              // Shadow position
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(PaddingSize.s10),
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: ColorsManager.darkWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomNetWorkImage(
                  imageUrl: productModel.product!.image!,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 200,
                      child: Text(
                        productModel.product!.name!,
                        style: StyleManager.title1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${productModel.product!.price!} \$",
                      style: StyleManager.subtitle,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
