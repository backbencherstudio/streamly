import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/model/content_details/episode.dart';
import 'episode_card.dart';

class EpisodesList extends StatelessWidget {
  final List<Episode> episodes;
  final Function(int index) onEpisodeTap;

  const EpisodesList({
    super.key,
    required this.episodes,
    required this.onEpisodeTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: episodes.length,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          return EpisodeCard(
            episode: episodes[index],
            onTap: () => onEpisodeTap(index),
          );
        },
      ),
    );
  }
}
