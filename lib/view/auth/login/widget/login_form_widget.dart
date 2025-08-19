import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/data/bloc/auth/login/login_bloc.dart';
import 'package:streamly/data/bloc/auth/login/login_event.dart';
import 'package:streamly/data/bloc/auth/login/login_state.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/themes/color.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/primary_button.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Successfully'),
            ),
          );
          context.go(RoutesName.navigationRoot);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _emailController,
              hintText: 'example@gmail.com',
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
              suffixIcon: Icon(
                Icons.visibility_off,
                size: 16.sp,
                color: AppColors.textPurple,
              ),
            ),
            SizedBox(height: 16.h),
            Transform.translate(
              offset: Offset(-8.w, 0),
              child: Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Transform.translate(
                    offset: Offset(-8.w, 0),
                    child: Text(
                      "Remember me",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.go('/forgotPasswordScreen');
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          child: Container(
                            width: 137,
                            height: 3,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            state is LoginLoading
                ? Center(child: CircularProgressIndicator())
                : PrimaryButton(
              text: 'Login',
              onTap: () {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  context.read<LoginBloc>().add(LoginSubmitEvent(
                    email: email,
                    password: password,
                  ));
                }
              },
            ),
          ],
        );
      }
    );
  }
}
