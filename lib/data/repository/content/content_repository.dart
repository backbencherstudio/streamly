import 'dart:convert';
import 'package:flutter/services.dart';

import '../../model/content/content_model.dart';


class ContentRepository {
  Future<List<ContentItem>> fetchContent({required bool isEpisode}) async {
    final String response = await rootBundle.loadString('assets/data/content.json');
    final data = json.decode(response);
    final List<dynamic> contentList = isEpisode ? data['episodes'] : data['similar'];
    return contentList.map((json) => ContentItem.fromJson(json)).toList();
  }
}
