import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kino_app/core/constants/version_enum.dart';

class Constants {
  Constants._();

  static const baseUrl = 'https://api.themoviedb.org/3/';
  static final apiKey = dotenv.env['API_KEY'] ?? 'Api key is not found';
  static const version = String.fromEnvironment('VERSION');
  static const Version running = version == 'lazy'
      ? Version.lazy
      : Version.wait;
  static const bigImageBaseUrl = 'https://image.tmdb.org/t/p/w780/';
  static const smallImageBaseUrl = 'https://image.tmdb.org/t/p/w200';
  static const originalImageBaseUrl = 'https://image.tmdb.org/t/p/original/';
  static const mediumImageBaseUrl = 'https://image.tmdb.org/t/p/w500';
}
