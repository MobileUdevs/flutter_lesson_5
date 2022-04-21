import 'package:bootcamp_sample_app/routes/app_routes.dart';
import 'package:bootcamp_sample_app/ui/home/home_page.dart';
import 'package:bootcamp_sample_app/ui/intro/onboarding_page.dart';

import '../ui/detailed_info/detailed_info_page.dart';

class AppPages {
  static final page = {
    AppRoutes.initial: (context) => const OnBoardingPage(),
    AppRoutes.home: (context) => const HomePage(),
    AppRoutes.detailedInfo:(context)=>const DetailedInfoPage(),
  };
}
