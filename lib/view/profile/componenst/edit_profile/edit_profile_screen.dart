import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:streamly/core/utils/api_end_point.dart';
import 'package:streamly/data/bloc/profile/edit_profile_image/edit_profile_image_event.dart';
import 'package:streamly/widgets/outlined_primary_button.dart';

import '../../../../core/constants/icons/icons.dart';
import '../../../../core/constants/images/images.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/color.dart';
import '../../../../data/bloc/auth/getMe/get_me_bloc.dart';
import '../../../../data/bloc/auth/getMe/get_me_event.dart';
import '../../../../data/bloc/auth/getMe/get_me_state.dart';
import '../../../../data/bloc/profile/edit_profile/edit_profile_bloc.dart';
import '../../../../data/bloc/profile/edit_profile/edit_profile_event.dart';
import '../../../../data/bloc/profile/edit_profile/edit_profile_state.dart';
import '../../../../data/bloc/profile/edit_profile_image/edit_profile_image_bloc.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/custom_text_field_with_background.dart';
import '../../../../widgets/primary_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;
  String image = '';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<GetMeBloc>().add(GetMeFetchEvent());
  }

  void savePhoto() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.background,
            title:
                const Text("Save Photo", style: TextStyle(color: Colors.white)),
            content: const Text("Are you sure you want to save this photo?",
                style: TextStyle(color: Colors.white)),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    _profileImage = null;
                    Navigator.pop(context);
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.white))),
              OutlinedButton(
                  onPressed: () async {
                    context.read<EditProfileImageBloc>().add(
                        EditProfileImageSubmitEvent(imagePath: _profileImage));
                    Navigator.pop(context);
                  },
                  child: Text("Save", style: TextStyle(color: Colors.white))),
            ],
          );
        });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Wrap(
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
                savePhoto();
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
                savePhoto();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMeBloc, GetMeState>(
      listener: (context, state) {
        if (state is GetMeSuccess) {
          _nameController.text = state.user.name;
          _emailController.text = state.user.email;
          _contactController.text = state.user.phone_number ?? '';
          image = state.user.imageUrl!.replaceFirst('http://localhost:4005/', '');;
        } else if (state is GetMeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Something went wrong')),
          );
        }
      },
      builder: (context, state) {
        if (state is GetMeLoading) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset(AppImages.background, fit: BoxFit.cover),
                ),
                Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )),
              ],
            ),
          );
        }

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (_, __) {
            context.go(RoutesName.navigationRoot);
          },
          child: Scaffold(
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
                        GestureDetector(
                          onTap: _pickImage,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(55.r),
                                child: Container(
                                  height: 110.h,
                                  width: 110.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: _profileImage != null
                                      ? Image.file(_profileImage!, fit: BoxFit.cover)
                                      : Image.network(
                                          ApiEndPoint.ImagePath(image),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 4,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.primary,
                                  child: const Icon(Icons.camera_alt,
                                      size: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
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
                                  context.go(RoutesName.paymentMethodScreen);
                                },
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            if (state is EditProfileLoading) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.white));
                            } else {
                              return PrimaryButton(
                                text: "Save Change",
                                onTap: () {
                                  final name = _nameController.text;
                                  final email = _emailController.text;
                                  final contact = _contactController.text;
                                  context.read<EditProfileBloc>().add(
                                        EditProfileSubmitEvent(
                                          name: name,
                                          email: email,
                                          phone_number: contact,
                                        ),
                                      );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
