import 'package:netflix_app/core/constant/api_urls.dart';
import 'package:netflix_app/infrasturucture/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}