import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/data/bloc/auth/forget_password/forget_password_bloc.dart';
import 'package:streamly/data/bloc/auth/verify_otp/verify_otp_bloc.dart';
import 'package:streamly/view/auth/forgot_password/widget/otp_verification_widget.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../../core/constants/images/images.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/auth/verify_otp/verify_otp_event.dart';
import '../../../data/bloc/auth/verify_otp/verify_otp_state.dart';


class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = context.watch<ForgetPasswordBloc>().email;
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          context.go(RoutesName.setNewPasswordScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('OTP sent to your email successfully'),
            ),
          );
        }
        if (state is VerifyOtpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Something went wrong. Please try again'),
            ),
          );
        }
      },
      builder: (context, state) {
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
                      SizedBox(height: 40.h), // Adjust as needed

                      CustomNabVer(),
                      SizedBox(
                        height: 35.h,
                      ),
                      Text(
                        "Check Your Email",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "We sent a verification link to $email",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      OtpVerificationWidget(
                        otpController: _otpController,
                      ),
                      SizedBox(height: 16.h),
                      PrimaryButton(
                        text: 'Verify email',
                        onTap: () {
                          final otp = _otpController.text;
                          context.read<VerifyOtpBloc>().add(
                            VerifyOtpSubmitEvent(
                              email: email ?? '',
                              otp: otp,
                            ),
                          );
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
      }
    );
  }
}
