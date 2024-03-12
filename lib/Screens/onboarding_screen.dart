import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:managment/Screens/get_started_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Slide> slides = [
    Slide(
      title: "Welcome to Fintech",
      widgetTitle: LottieBuilder.asset(
        'assets/animation_lmjtdifi.json',
        width: 400,
        height: 300,
      ),
      description:
      "App fintech trên điện thoại.\n\nDễ dàng kiểm soát chi tiêu của bạn, giúp bạn đạt được mục tiêu tài chính của mình",
      backgroundColor: Colors.white, // White background
      styleTitle: const TextStyle(
        color: Colors.blue, // Blue text color
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      styleDescription: const TextStyle(
        color: Colors.blue, // Black text color for content
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    Slide(
      title: "Dễ dàng sử dụng",
      widgetTitle: LottieBuilder.asset(
        'assets/NQpSWZfdkg.json',
        width: 400,
        height: 280,
      ),
      description:
      "Dễ dàng theo dõi chi tiêu hàng ngày, tuần, hoặc tháng.\n\nChia ra thành nhiều khoản chi tiêu khác nhau.",
      backgroundColor: Colors.blue, // Blue background
      styleDescription: const TextStyle(
        color: Colors.white, // White text color
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      styleTitle: const TextStyle(
        color: Colors.white, // White text color for content
        fontSize: 18,
      ),
    ),
    Slide(
      title: "Ai hỗ trợ",
      widgetTitle: LottieBuilder.asset(
        'assets/animation_lmjtperk.json',
        width: 400,
        height: 300,
      ),
      description:
      "Dễ dàng hơn với AI chat bot, giúp bạn nhiều hơn nữa",
      backgroundColor: Colors.white, // White background
      styleDescription: const TextStyle(
        color: Colors.blue, // White text color
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      styleTitle: const TextStyle(
        color: Colors.white, // White text color for content
        fontSize: 18,
      ),
    ),
  ];

  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Automatically transition to the next slide every 2 seconds
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentIndex < slides.length - 1) {
        currentIndex++;
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // When the last slide is reached, navigate to the "Get Started" screen
        _navigateToGetStarted();
        timer.cancel(); // Cancel the timer to stop automatic transitions
      }
    });
  }

  void _navigateToGetStarted() async {
    // Delay the navigation to give time for the user to view the slides
    await Future.delayed(const Duration(seconds: 3)); // Adjust the duration as needed

    // Navigate to the "Get Started" screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const GetStartedScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: slides.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              IntroSlider(
                slides: [slides[index]],
                renderDoneBtn: Container(), // Remove the "Done" button
                renderSkipBtn: Container(), // Remove the "Skip" button
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentIndex != 0)
                        InkWell(
                          onTap: () {
                            // Handle the "Previous" link tap
                            currentIndex--;
                            _pageController.animateToPage(
                              currentIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            "",
                            style: TextStyle(
                              color: Colors.blue, // Customize link color
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      // No "Next" button
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


