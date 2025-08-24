import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/data/bloc/profile/edit_password/edit_password_bloc.dart';
import 'package:streamly/data/bloc/profile/edit_password/edit_password_event.dart';

import '../../../../core/constants/images/images.dart';
import '../../../../core/themes/color.dart';
import '../../../../data/bloc/profile/edit_password/edit_password_state.dart';
import '../../../../widgets/custom_nab_ver.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/primary_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _currentPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPasswordBloc, EditPasswordState>(
      listener: (context, state) {
        if (state is EditPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password changed successfully')),
          );
          _newPasswordController.clear();
          _currentPasswordController.clear();
          _confirmPasswordController.clear();
        } else if (state is EditPasswordFailure) {
          if (state.error.contains('401')) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Current Password is incorrect')),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not change password')),
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
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        CustomNabVer(title: 'Change Password'),
                        SizedBox(height: 20.h),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 16.h),
                              CustomTextField(
                                hintText: 'Current Password',
                                controller: _currentPasswordController,
                                isObSecure: true,
                              ),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                hintText: 'New Password',
                                controller: _newPasswordController,
                                isObSecure: true,
                              ),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                hintText: 'Confirm Password',
                                controller: _confirmPasswordController,
                                isObSecure: true,
                              ),
                              SizedBox(height: 64.h),
                              BlocBuilder<EditPasswordBloc, EditPasswordState>(
                                builder: (context, state) {
                                  if (state is EditPasswordLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator(
                                            color: AppColors.white));
                                  } else {
                                    return PrimaryButton(
                                      text: 'Change Password',
                                      onTap: () async {
                                        final currentPassword = _currentPasswordController.text;
                                        final newPassword = _newPasswordController.text;
                                        final confirmNewPassword = _confirmPasswordController.text;
                                        if (newPassword == confirmNewPassword) {
                                          context.read<EditPasswordBloc>().add(
                                            EditPasswordSubmitEvent(newPassword: newPassword, currentPassword: currentPassword),
                                          );

                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Passwords do not match')),
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
