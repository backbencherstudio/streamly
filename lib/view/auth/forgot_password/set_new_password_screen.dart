import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/data/bloc/auth/reset_password/reset_password_bloc.dart';

import '../../../core/constants/images/images.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/auth/reset_password/reset_password_event.dart';
import '../../../data/bloc/auth/reset_password/reset_password_state.dart';
import '../../../widgets/custom_nab_ver.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  _SetNewPasswordScreenState createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasNumber = false;
  bool _passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_validateConfirmPassword);
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
      _hasLowercase = RegExp(r'[a-z]').hasMatch(password);
      _hasNumber = RegExp(r'[0-9]').hasMatch(password);
      _validateConfirmPassword();
    });
  }

  void _validateConfirmPassword() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    setState(() {
      _passwordsMatch = confirmPassword.isEmpty || password == confirmPassword;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFormValid = _hasMinLength &&
        _hasUppercase &&
        _hasLowercase &&
        _hasNumber &&
        _passwordsMatch;

    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          context.go(RoutesName.resetSuccessSScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Password reset successfully'),
            ),
          );
        }
        if (state is ResetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
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
                      SizedBox(height: 40.h),
                      CustomNabVer(),
                      SizedBox(height: 35.h),
                      Text(
                        "Set New Password",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Your new password must be different to previously used passwords.",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 40.h),

                      // Password Field
                      CustomTextField(controller: _passwordController, hintText: 'New Password'),
                      SizedBox(height: 12.h),

                      // Password Conditions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildCondition(_hasMinLength, '8 characters'),
                                SizedBox(height: 15.h),
                                buildCondition(_hasNumber, 'Number (0–9)'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildCondition(
                                    _hasUppercase, 'Uppercase letter (A–Z)'),
                                SizedBox(height: 15.h),
                                buildCondition(
                                    _hasLowercase, 'Lowercase letter (a–z)'),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      // Confirm Password Field
                      CustomTextField(controller: _confirmPasswordController, hintText: 'Confirm Password'),

                      SizedBox(height: 30.h),

                      // Reset Button
                      PrimaryButton(
                        text: 'Reset password',
                        onTap: () {
                          final password = _passwordController.text;
                          final confirmPassword = _confirmPasswordController.text;
                          if (isFormValid && password == confirmPassword) {
                            context.read<ResetPasswordBloc>().add(ResetPasswordSubmitEvent(password: password));
                          }
                        },
                      ),
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

  Widget buildCondition(bool isMet, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.cancel,
          color: isMet ? Colors.green : Colors.red,
          size: 14.sp,
        ),
        SizedBox(width: 3.w),
        Text(
          text,
          style: TextStyle(
              color: isMet ? Colors.white : Colors.red,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
