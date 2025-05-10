import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool kidsMode = false;
  String selectedLanguage = 'English';
  String currentPlan = 'Free';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF0A0212), // Replace with AppColors.background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            splashRadius: 24,
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olivia Carter',
                      style: TextStyle(
                          color: const Color(0xFF9D4EDD),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                    Text(
                      'olivia98@gmail.com',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.edit, color: Colors.white),
              ],
            ),
            SizedBox(height: 24.h),
            _sectionTitle('Preferences'),
            _preferenceTile(
              icon: Icons.child_care,
              title: 'Kids Mode',
              trailing: CupertinoSwitch(
                value: kidsMode,
                activeColor: const Color(0xFF9D4EDD),
                onChanged: (val) => setState(() => kidsMode = val),
              ),
            ),
            _preferenceTile(
              icon: Icons.language,
              title: 'Languages',
              trailing: _dropdown(['English', 'Bangla'], selectedLanguage,
                  (val) => setState(() => selectedLanguage = val!)),
            ),
            _preferenceTile(
              icon: Icons.download_rounded,
              title: 'Downloaded',
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16),
              onTap: () => context.push('/profile/downloadScreen'),
            ),
            _preferenceTile(
              icon: Icons.storage,
              title: 'Storage',
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16),
              onTap: () => context.push('/profile/storageManagementScreen'),
            ),
            _preferenceTile(
              icon: Icons.workspace_premium,
              title: 'Current Plan',
              trailing: _dropdown(['Free', 'Premium'], currentPlan,
                  (val) => setState(() => currentPlan = val!)),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9D4EDD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: Text(
                  'Upgrade Plan',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            _sectionTitle('Account Security'),
            _preferenceTile(
              icon: Icons.lock,
              title: 'Change Password',
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16),
              onTap: () => context.push('/profile/forgotPasswordScreen'),
            ),
            _preferenceTile(
              icon: Icons.settings,
              title: 'Settings',
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16),
              onTap: () => context.push('/profile/settingScreen'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, top: 24.h),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _preferenceTile({
    required IconData icon,
    required String title,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1A082B),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFF9D4EDD), width: 0.4),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF9D4EDD), size: 20),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _dropdown(
      List<String> items, String selected, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      dropdownColor: const Color(0xFF1A082B),
      value: selected,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
      underline: const SizedBox(),
      style: TextStyle(color: Colors.white, fontSize: 14.sp),
      borderRadius: BorderRadius.circular(10.r),
      items: items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e, style: const TextStyle(color: Colors.white)),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
