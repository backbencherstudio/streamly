import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_point.dart';
import '../../../model/content/favorite/favorite_content_model.dart';

class FavoriteContentRepository {
  final ApiService apiService = ApiService();

  Future<List<FavoriteContentModel>> fetchFavoriteContent() async {
    final response = await apiService.get(ApiEndPoint.getFavoriteContent);
    final data = response.data;
    if (data is List) {
      return data.map((e) => FavoriteContentModel.fromJson((e as Map).cast<String, dynamic>(),)).toList();
    }
    throw Exception('Unexpected response format');
  }
}