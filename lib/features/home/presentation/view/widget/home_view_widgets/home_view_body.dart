import 'package:flutter/widgets.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/home_app_bar.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/home_brands_sections.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/home_search.dart';
import 'package:yallanshop/features/home/presentation/view/widget/home_view_widgets/new_arrival_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.s20),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const HomeAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: PaddingSize.s20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.hello,style: StyleManager.headLine1),
                  Text(AppStrings.rayaWelcome,style: StyleManager.subtitle),
                ],),
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeSearch(),
            ),
            const SliverToBoxAdapter(
              child: HomeBrandSections(),
            ),
            const SliverToBoxAdapter(
              child: NewArrivalSection(),
            ),
          ],
        ),
      ),
    );
  }
}
