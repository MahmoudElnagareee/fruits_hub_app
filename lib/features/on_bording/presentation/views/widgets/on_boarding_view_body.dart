import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constants.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singltone.dart';
import 'package:fruits_hub_app/core/utils/app_colors.dart';
import 'package:fruits_hub_app/core/widgets/custom_button.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub_app/features/on_bording/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(.5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: CustomButton(
              text: 'ابدأ الان',
              onPressed: () {
                Prefs.setBool(KIsOnBoardingViewSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
