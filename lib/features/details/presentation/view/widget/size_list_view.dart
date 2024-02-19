import 'package:flutter/widgets.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';

import '../../../../../core/resources/app_size.dart';
import '../../../../../core/resources/style.dart';

class SizeListView extends StatelessWidget {
  final List<String> list;
  const SizeListView({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.size,
          style: StyleManager.headLine3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.s10),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.darkWhite,
                ),
                child: Center(
                    child: Text(
                  list[index],
                  style: StyleManager.headLine4,
                )),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 9),
              itemCount: list.length,
            ),
          ),
        ),
      ],
    );
  }
}
