import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamly/view/profile/componenst/help_support/widget/faq.dart';
import 'package:streamly/view/profile/componenst/help_support/widget/help_bottom_section.dart';
import 'package:streamly/view/profile/componenst/notification/widget/notification_tile.dart';
import 'package:streamly/widgets/primary_button.dart';
import 'package:streamly/widgets/search_widget.dart';
import '../../../../core/constants/icons/icons.dart';
import '../../../../core/constants/images/images.dart';
import '../../../../core/themes/color.dart';
import '../../../../widgets/custom_nab_ver.dart';
import '../../../../widgets/custom_text_field_with_background.dart';
import '../../../../widgets/description_field.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});
  final List<String> faqList = const [
    "How do I subscribe to premium?",
    "How to change my password?",
    "Why is my video buffering?",
    "How to cancel my subscription?"
  ];
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
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    const CustomNabVer(title: 'Help & Support'),
                    SizedBox(height: 8.h),
                    Text(
                      'How can I help you?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(child:  SearchWidget()),
                        SizedBox(width: 16.w),
                        Container(
                          padding: EdgeInsets.all(7.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xff19161D)),
                            color: const Color(0xff07020A),
                          ),
                          child: Image.asset(
                            AppIcons.filter,
                            scale: 1.5,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Faq(faqList: faqList),
                    SizedBox(
                      height: 15.h,
                    ),
                    NotificationTile(title: "About Streamly"),
                    NotificationTile(title: "Accessibility"),
                    NotificationTile(title: "Settings Features"),
                    NotificationTile(title: "Start Live Chat"),
                    NotificationTile(title: "Submit a Ticket"),
                    SizedBox(
                      height: 24.h,
                    ),
                    Divider(
                      color: AppColors.secondaryBorderColor,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    customContainerWithBackground(
                      hintText: "Issue type",
                      iconPath: AppIcons.issue,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DescriptionField(
                      hintText: 'Description',
                      maxLines: 5,
                      fileColor: Color(0xff160621),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PrimaryButton(text: "Submit", onTap: () {}),
                    HelpBottomSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
