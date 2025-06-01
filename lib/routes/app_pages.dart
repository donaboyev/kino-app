import 'package:get/get.dart';

import '../binding/bindings.dart';
import '../ui/screens.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.movieDetail,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.personDetail,
      page: () => const PersonDetailPage(),
      binding: PersonDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.discoverMore,
      page: () => const DiscoverMorePage(),
      binding: DiscoverMoreBinding(),
    ),
    GetPage(
      name: AppRoutes.nowPlayingMore,
      page: () => const NowPlayingMorePage(),
      binding: NowPlayingMoreBinding(),
    ),
    GetPage(
      name: AppRoutes.popularMore,
      page: () => const PopularMorePage(),
      binding: PopularMoreBinding(),
    ),
    GetPage(
      name: AppRoutes.topRatedMore,
      page: () => const TopRatedMorePage(),
      binding: TopRatedMoreBinding(),
    ),
    GetPage(
      name: AppRoutes.peopleMore,
      page: () => const PeopleMorePage(),
      binding: PeopleMoreBinding(),
    ),
  ];
}
