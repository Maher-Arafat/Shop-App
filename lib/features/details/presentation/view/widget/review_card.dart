import 'package:flutter/material.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/features/home/data/model/reviews_model.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/style.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);
  final ReviewsModel review;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      child: Image.network(review.image!),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review.name!,
                          style: StyleManager.title1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 11,
                              color: ColorsManager.lightGrey,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              review.time.toString(),
                              style: StyleManager.subtitle2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          review.rating.toString(),
                          style: StyleManager.title1,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          AppStrings.rating,
                          style: StyleManager.subtitle2,
                        )
                      ],
                    ),
                    /// TO DO Later
                    //getRating()
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            review.review!,
            style: StyleManager.subtitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

}
