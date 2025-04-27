import 'package:e_commerce/utils/constants/color.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkk = THelperFunctions.isDarkMode(context);
    final darkk2 = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OnboardingController());
    final controller1 = OnboardingController.instance;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              onBoardingPage(
                image: TImages.onboardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),

              onBoardingPage(
                image: TImages.onboardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),

              onBoardingPage(
                image: TImages.onboardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          Positioned(
            right: TSizes.defaultSpace,
            top: TDeviceUtils.getAppBarHeight(),
            child: TextButton(
              onPressed: () => OnboardingController.instance.skipPage(),
              child: const Text('Skip'),
            ),
          ),

          Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
            left: 170,
            child: SmoothPageIndicator(
              count: 3,
              controller: controller1.pageController,
              onDotClicked: controller1.dotNavigationClick,
              effect: ExpandingDotsEffect(
                activeDotColor: darkk ? TColors.light : TColors.dark,
                dotHeight: 6,
              ),
            ),
          ),

          Positioned(
            right: TSizes.defaultSpace,
            bottom: TDeviceUtils.getBottomNavigationBarHeight(),
            child: ElevatedButton(
              onPressed: () =>OnboardingController.instance.nextPage(),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: darkk2 ? TColors.primary : Colors.black,
              ),
              child: Icon(Iconsax.arrow_right_34),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
