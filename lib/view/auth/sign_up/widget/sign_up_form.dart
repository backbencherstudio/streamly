import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/core/routes/routes.dart';

import '../../../../core/themes/color.dart';
import '../../../../data/bloc/auth/sign_up/sign_up_bloc.dart';
import '../../../../data/bloc/auth/sign_up/sign_up_event.dart';
import '../../../../data/bloc/auth/sign_up/sign_up_state.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/primary_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Register Successfully'),
            ),
          );
          context.go(RoutesName.navigationRoot);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your full name',
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your email address',
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Enter a password',
              suffixIcon: Icon(
                Icons.visibility_off,
                size: 16.sp,
                color: AppColors.textPurple,
              ),
            ),
            const SizedBox(height: 32),
            state is SignUpLoading
                ? Center(child: CircularProgressIndicator())
                : PrimaryButton(
              text: 'Create account',
              onTap: () {
                final email = _emailController.text.trim();
                final name = _nameController.text.trim();
                final password = _passwordController.text.trim();

                if (email.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
                  context.read<SignUpBloc>().add(SignUpSubmitEvent(
                    email: email,
                    name: name,
                    password: password,
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }
}
