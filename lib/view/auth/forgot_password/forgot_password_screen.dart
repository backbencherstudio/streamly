import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/data/bloc/auth/forget_password/forget_password_bloc.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import 'package:streamly/widgets/primary_button.dart';

import '../../../core/constants/images/images.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/auth/forget_password/forget_password_event.dart';
import '../../../data/bloc/auth/forget_password/forget_password_state.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
      if (state is ForgetPasswordSuccess) {
        context.go(RoutesName.verifyCodeScreen);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP sent to your email successfully'),
          ),
        );
      }
      if (state is ForgetPasswordFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong. Please try again'),
          ),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppImages.background, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    CustomNabVer(),
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "No worries, we’ll send you reset instructions.",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    CustomTextField(
                        controller: _emailController,
                        hintText: 'Input your email address'),
                    SizedBox(height: 16.h),
                    state is ForgetPasswordLoading
                        ? const Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            text: 'Send email',
                            onTap: () {
                              final email = _emailController.text;
                              context.read<ForgetPasswordBloc>().add(ForgetPasswordSubmitEvent(email: email));
                            },
                          ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
