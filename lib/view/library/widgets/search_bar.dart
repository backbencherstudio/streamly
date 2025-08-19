import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../core/constants/icons/icons.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/library_bloc/library_bloc.dart';
import '../../../data/bloc/library_bloc/library_event.dart';
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
            context
                .read<LibraryBloc>()
                .add(SearchQueryChanged(val.recognizedWords));
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
            child: TextFormField(
              onTap: () {
                context.read<LibraryBloc>().add(FocusSearchField(true));
              },
              onChanged: (text) {
                context.read<LibraryBloc>().add(SearchQueryChanged(text));
              },
              onFieldSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  context.read<LibraryBloc>().add(SearchQueryChanged(value));
                  context.push(RoutesName.searchResult);
                }
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                filled: true,
                fillColor: const Color(0xff0E0A05),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(AppIcons.search, width: 20, height: 20),
                ),
                suffixIcon: SizedBox(
                  width: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Container(
                          height: 23,
                          width: 2,
                          color: const Color(0xff9F9D9B),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xff554444),
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: _listen,
                          child: Icon(
                            _isListening ? Icons.mic_none : Icons.mic,
                            color: AppColors.icon,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xff221E19)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xff221E19)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide:
                      const BorderSide(width: 2, color: Color(0xff221E19)),
                ),
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
                barrierColor: AppColors.black.withAlpha(54),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (_, __, ___) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: const FilterDialog(),
                    ),
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                        .animate(anim),
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
                border:
                    Border.all(color: AppColors.secondaryBorderColor, width: 1),
              ),
              child: Icon(Icons.tune, color: AppColors.lightGrey, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
