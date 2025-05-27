import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/config/images/images.dart';
import 'package:streamly/view/profile/componenst/add_new_card/widget/camera_text.dart';
import 'package:streamly/view/profile/componenst/payment_method/widget/payment_card_tile.dart';
import 'package:streamly/widgets/custom_nab_ver.dart';
import 'package:streamly/widgets/outlined_primary_button.dart';
import 'package:streamly/widgets/primary_button.dart';


class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String selectedMethod = "paypal";
  final TextEditingController controller = TextEditingController();

  Future<void> _openFullScreenScanner(BuildContext context) async {
    // final result = await Navigator.push<String>(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const ScannerCameraScreen(),
    //   ),
    // );
    //
    // if (result != null && mounted) {
    //   setState(() {
    //     controller.text = result;
    //   });
    // }
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNabVer(
                      title: "Payment Methods",
                      trailing: AppIcons.scan,
                      onTap: () {
                        _openFullScreenScanner(context);
                      },
                    ),
                    SizedBox(height: 24.h),

                    TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Scanned text here...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                    ),

                    SizedBox(height: 24.h),
                    PaymentTile(
                      title: "PayPal",
                      icon: AppIcons.paypal,
                      value: "paypal",
                      groupValue: selectedMethod,
                      onChanged: (val) => setState(() => selectedMethod = val!),
                    ),
                    PaymentTile(
                      title: "Credit Card",
                      icon: AppIcons.google,
                      value: "card",
                      groupValue: selectedMethod,
                      onChanged: (val) => setState(() => selectedMethod = val!),
                    ),
                    PaymentTile(
                      title: "Google Pay",
                      icon: AppIcons.apple,
                      value: "gpay",
                      groupValue: selectedMethod,
                      onChanged: (val) => setState(() => selectedMethod = val!),
                    ),
                    SizedBox(height: 24.h),
                    OutlinedPrimaryButton(
                      text: "Add New Card",
                      onTap: () {
                        context.push('/addNewCardScreen');
                      },
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            text: 'Cancel',
                            onTap: () {},
                            color: const Color(0xff1C082A),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: PrimaryButton(
                            text: 'Submit',
                            onTap: () {
                              context.push('/reviewCardSummeryScreen');
                            },
                            color: const Color(0xff7A25BC),
                          ),
                        )
                      ],
                    )
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
