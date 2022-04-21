import 'package:bootcamp_sample_app/routes/app_routes.dart';
import 'package:bootcamp_sample_app/theme/app_contats.dart';
import 'package:bootcamp_sample_app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_colors.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageController = PageController();
  int _page = 0;
  List<IntroModel> intros = [
    IntroModel(
      lottie: 'assets/lottie/lottie_1.json',
      title: 'Lottie 1',
    ),
    IntroModel(
      lottie: 'assets/lottie/lottie_2.json',
      title: 'Lottie 2',
    ),
    IntroModel(
      lottie: 'assets/lottie/lottie_3.json',
      title: 'Lottie 3',
    ),
    IntroModel(
      lottie: 'assets/lottie/lottie_4.json',
      title: 'Lottie 4',
    ),
  ];

  nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 16),
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                itemCount: intros.length,
                onPageChanged: (i) => setState(() {
                  _page = i;
                }),
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.67,
                          child: Center(
                            child: LottieBuilder.asset(intros[index].lottie),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          intros[index].title,
                          style: AppTextStyles.introTitle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 8,
                    child: Center(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_, i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: i == _page ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: i == _page
                                ? AppColors.assets
                                : AppColors.black3,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(
                          width: 8,
                        ),
                        itemCount: intros.length,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: _page != 3,
                    child: ElevatedButton(
                      autofocus: true,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          AppContants.key.currentState!.context,
                          AppRoutes.home,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ).copyWith(
                        elevation: MaterialStateProperty.resolveWith<double>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return 0;
                            return 0;
                          },
                        ),
                      ),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.lightGreyEA,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Skip',
                          style: AppTextStyles.defaultButtonBlack,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    autofocus: true,
                    onPressed: () {
                      setState(() {
                        debugPrint(_page.toString());
                        if (_page == 3) {
                          setState(() {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, AppRoutes.home);
                          });
                        } else {
                          setState(() {
                            nextPage();
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ).copyWith(
                      elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) return 0;
                          return 0;
                        },
                      ),
                    ),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.assets,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Continue',
                        style: AppTextStyles.defaultButtonStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroModel {
  final String lottie;
  final String title;

  IntroModel({
    required this.lottie,
    required this.title,
  });
}
