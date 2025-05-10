import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/home/components/content_details/widget/person_card.dart';

import '../../../../../model/content_details/person.dart';

class CastCrewList extends StatelessWidget {
  final List<Person> people;

  const CastCrewList({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: people.length,
        separatorBuilder: (_, __) => SizedBox(width: 24.w),
        itemBuilder: (context, index) {
          final person = people[index];
          return PersonCard(
            name: person.name,
            role: person.role,
            imageUrl: person.imageUrl,
          );
        },
      ),
    );
  }
}
