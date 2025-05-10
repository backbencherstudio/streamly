import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/home/components/content_details/widget/trailer_card.dart';

import '../../../../../model/content_details/trailer.dart';

class TrailerList extends StatelessWidget {
  final List<Trailer> trailers;
  final Function(int index) onTap;

  const TrailerList({
    super.key,
    required this.trailers,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: trailers.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        return TrailerCard(
          trailer: trailers[index],
          onTap: () => onTap(index),
        );
      },
    );
  }
}

