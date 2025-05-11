import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../../../config/icons/icons.dart';
import '../../../../config/images/images.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/custom_text_field_with_background.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;

  final _nameController = TextEditingController(text: 'Olivia Carter');
  final _emailController = TextEditingController(text: 'olivia98@gmail.com');
  final _contactController = TextEditingController(text: '+880 1234-567890');
  final _passwordController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take Photo"),
            onTap: () async {
              Navigator.pop(context);
              final pickedFile =
                  await picker.pickImage(source: ImageSource.camera);
              if (pickedFile != null) {
                setState(() {
                  _profileImage = File(pickedFile.path);
                });
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Choose from Gallery"),
            onTap: () async {
              Navigator.pop(context);
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(() {
                  _profileImage = File(pickedFile.path);
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : const AssetImage(AppImages.user_1)
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.primary,
                            child: const Icon(Icons.camera_alt,
                                size: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Name',
                          controller: _nameController,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: 'Email',
                          controller: _emailController,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: 'Contact',
                          controller: _contactController,
                        ),
                        SizedBox(height: 16.h),
                        customContainerWithBackground(
                          hintText: "Manage Card",
                          iconPath: AppIcons.storage,
                          onTap: () {
                            context.push(RoutesName.paymentMethodScreen);
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: 'Change password',
                          isObSecure: true,
                          controller: _passwordController,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hintText: 'Confirm Change password',
                          isObSecure: true,
                          controller: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: "Save Change",
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Changes saved.")),
                        );
                      }
                      context.push(RoutesName.profileManagementScreen);
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
