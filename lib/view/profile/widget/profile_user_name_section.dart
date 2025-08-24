import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/core/utils/api_end_point.dart';

import '../../../core/constants/icons/icons.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/auth/getMe/get_me_bloc.dart';
import '../../../data/bloc/auth/getMe/get_me_state.dart';

class ProfileUserNameSection extends StatelessWidget {
  const ProfileUserNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMeBloc, GetMeState>(
      builder: (context, state) {
        String name = 'Unknown';
        String email = 'unknown';
        String profileImage = '';

        if (state is GetMeSuccess) {
          name = state.user.name;
          email = state.user.email;
          profileImage = state.user.imageUrl ?? '';
        } else if (state is GetMeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something went wrong')),
          );
        }

        String newUrl = profileImage.replaceFirst('http://localhost:4005/', '');

        return Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.r),
                child: Image.network(
                  ApiEndPoint.ImagePath(newUrl),
                  width: 56.w,
                  height: 56.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image_outlined),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.textPrimary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                context.go(RoutesName.editProfileScreen);
              },
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: const Color(0xff1E092E),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppIcons.edit,
                  color: AppColors.textPrimary,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
