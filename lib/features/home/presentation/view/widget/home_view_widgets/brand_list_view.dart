import 'package:flutter/widgets.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/features/home/data/model/category_model.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/brand_container.dart';

class BrandListView extends StatelessWidget {
  final List<CategoryDataModel> brandList;

  const BrandListView({
    Key? key,
    required this.brandList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            BrandContainer(categoryDataModel: brandList[index]),
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSize.s10),
        itemCount: brandList.length,
      ),
    );
  }
}
