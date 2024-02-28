import 'package:get/get.dart';
import 'package:playstore_clone/app/playstore/view/about_page/view/playstore_page.dart';
import 'package:playstore_clone/app/playstore/binding/playstore_binding.dart';
import 'package:playstore_clone/app/playstore/view/rating_page/view/rating_page.dart';

class Routes {
  static const playstorePage = '/playstorePage';
  static const ratingPage = '/ratingPage';

  static var list = [
    GetPage(
      name: playstorePage,
      page: () => const PlaystorePage(),
      binding: PlaystoreBinding(),
    ),
    GetPage(
      name: ratingPage,
      page: () => const RatingPage(),
      binding: PlaystoreBinding(),
    ),
  ];
}
