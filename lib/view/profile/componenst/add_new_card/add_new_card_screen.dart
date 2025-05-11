import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/profile/componenst/add_new_card/widget/camera_text.dart';

class AppImages {
  static const String background = 'assets/images/background.svg';
  static const String visa = 'assets/images/visa.png';
  static const String visa_text = 'assets/images/visa_text.png';
}

class AppIcons {
  static const String scan = 'assets/icons/scan.png';
  static const String calender = 'assets/icons/calender.png';
}

class AppColors {
  static const Color textPrimary = Colors.black;
}

class CustomNabVer extends StatelessWidget {
  final String title;
  final String trailing;
  final VoidCallback onTap;

  const CustomNabVer({
    super.key,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(trailing, width: 24.w, height: 24.h),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  Future<void> _openScanner() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScannerCameraScreen(),
      ),
    );

    if (result != null && result is String) {
      _extractCardData(result);
    }
  }

  void _extractCardData(String scannedText) {
    final cardNumberRegex = RegExp(r'\b(?:\d[ -]?){13,16}\b');
    final lines = scannedText.split('\n');

    String? name;
    String? cardNumber;

    for (String line in lines) {
      final numberMatch = cardNumberRegex.firstMatch(line);
      if (numberMatch != null && cardNumber == null) {
        cardNumber = numberMatch.group(0)?.replaceAll(RegExp(r'[ -]'), '');
      } else if (name == null && RegExp(r'^[A-Z ]{3,}\$').hasMatch(line.trim())) {
        name = line.trim();
      }
    }

    setState(() {
      if (cardNumber != null) _cardNumberController.text = cardNumber;
      if (name != null) _cardNameController.text = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNabVer(
                      title: "Add New Card",
                      trailing: AppIcons.scan,
                      onTap: _openScanner,
                    ),
                    SizedBox(height: 32.h),
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: AssetImage(AppImages.visa),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Credit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset(AppImages.visa_text),
                            ],
                          ),
                          const Spacer(),
                          ValueListenableBuilder(
                            valueListenable: _cardNumberController,
                            builder: (context, TextEditingValue value, _) {
                              return Text(
                                value.text.isEmpty
                                    ? "1234 5678 9012 3456"
                                    : value.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 8.h),
                          ValueListenableBuilder(
                            valueListenable: _cardNameController,
                            builder: (context, TextEditingValue value, _) {
                              return Text(
                                value.text.isEmpty
                                    ? "Sophia Carter"
                                    : value.text,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      "Card Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: _cardNumberController,
                      hintText: "3827 4637 3103 4679",
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Card Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: _cardNameController,
                      hintText: "Sophia Carter",
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiry Date",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                controller: _expiryDateController,
                                hintText: "06/12/25",
                                suffixIcon:
                                Image.asset(AppIcons.calender, scale: 2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                controller: _cvvController,
                                hintText: "244",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    PrimaryButton(
                      text: 'Add',
                      onTap: () {
                        // Implement card addition logic here
                      },
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}