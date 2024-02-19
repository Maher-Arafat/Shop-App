import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanshop/core/resources/app_size.dart';
import 'package:yallanshop/core/resources/app_strings.dart';
import 'package:yallanshop/core/resources/colors_manager.dart';
import 'package:yallanshop/core/resources/style.dart';
import 'package:yallanshop/core/widgets/custom_progress_indicator.dart';
import 'package:yallanshop/features/home/presentation/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:yallanshop/features/home/presentation/cubits/get_profile_cubit/get_profile_state.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileSuccessState) {
          if (state.profileModel.status == true) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: CircleAvatar(
                        backgroundColor: ColorsManager.darkWhite,
                        radius: 50,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: state.profileModel.data!.image!,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.profileModel.data!.name!,
                          style: StyleManager.headLine3,
                        ),
                        Text(
                          AppStrings.verifiedProfile,
                          style: StyleManager.subtitle2,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 66,
                  height: 32,
                  decoration: BoxDecoration(
                    color: ColorsManager.darkWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '${state.profileModel.data!.points!.toString()} Points',
                      style: StyleManager.subtitle2,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text('');
          }
        } else if (state is GetProfileErrorState) {
          return Text(state.errorMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
