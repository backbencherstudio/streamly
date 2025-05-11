import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/routes/routes.dart';

import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';
import '../../../themes/color.dart';
import 'filter_modal_sheet.dart';

class SearchBarLibrary extends StatefulWidget {
  const SearchBarLibrary({super.key});

  @override
  State<SearchBarLibrary> createState() => _SearchBarLibraryState();
}

class _SearchBarLibraryState extends State<SearchBarLibrary> {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          if (val == 'done' || val == 'notListening') {
            setState(() => _isListening = false);
            _speech.stop();
          }
        },
        onError: (val) {
          print('Speech recognition error: $val');
          setState(() => _isListening = false);
        },
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            context.read<LibraryBloc>().add(SearchQueryChanged(val.recognizedWords));
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.containerBackground,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.secondaryBorderColor, width: 1),
              ),
              child: Row(
                children: [
                  Image.asset(AppIcons.search, color: AppColors.lightGrey, width: 20.w, height: 20.h),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      onTap: () {
                        context.read<LibraryBloc>().add(FocusSearchField(true));
                      },
                      onChanged: (text) {
                        context.read<LibraryBloc>().add(SearchQueryChanged(text));
                      },
                      onSubmitted: (text) {
                        context.read<LibraryBloc>().add(SearchQueryChanged(text));
                        context.push(RoutesName.searchResult);
                      },
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                      cursorColor: AppColors.textPrimary,
                      decoration: InputDecoration(
                        hintText: 'Search..........',
                        hintStyle: TextStyle(color: AppColors.grey, fontSize: 14.sp),
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _listen,
                    child: Icon(
                      _isListening ? Icons.mic_none : Icons.mic,
                      color: AppColors.icon,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Filter",
                barrierColor: AppColors.black.withOpacity(0.54),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (_, __, ___) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 110.h),
                      child: const FilterDialog(),
                    ),
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
                    child: child,
                  );
                },
              ).then((_) {
                context.push(RoutesName.filterResult);
              });
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.containerBackground,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.secondaryBorderColor, width: 1),
              ),
              child: Icon(Icons.tune, color: AppColors.lightGrey, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
