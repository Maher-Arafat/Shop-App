import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/features/details/presentation/view/widget/review_card.dart';
import 'package:yallanshop/features/home/data/model/reviews_model.dart';
import '../../../../../core/resources/style.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({
    Key? key,
    required this.review,
  }) : super(key: key);
  final ReviewsModel review;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.reviews,
              style: StyleManager.headLine3,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                 AppStrings.viewAll,
                  style: StyleManager.subtitle,
                ))
          ],
        ),
       
        ReviewCard(review: review)
      ],
    );
  }
}
