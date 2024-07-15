import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translation_app/screens/onBoarding_screens/widget/onboarding_slide.dart';
import 'package:translation_app/utils/extensions/extensions.dart';

import '../login_screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> _slides = [
    OnboardingSlide(
      //imagePath: 'assets/images/onboarding_1.png',
      imagePath: 'onboarding_1'.pngImage,
      title: 'Translate Text Instantly, Connect Globally!',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever.',
    ),
    OnboardingSlide(
      //imagePath: 'assets/images/onboarding_2.png',
      imagePath: 'onboarding_2'.pngImage,
      title: 'Speak and Understand Instantly',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever.',
    ),
    OnboardingSlide(
      //imagePath: 'assets/images/onboarding_3.png',
      imagePath: 'onboarding_3'.pngImage,
      title: 'Capture Translate and Understand Instantly!',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever.',
    ),
  ];

  void _onNextPressed() {
    if (_currentIndex < _slides.length - 1) {
      _controller.nextPage();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _slides.map((slide) {
                  int index = _slides.indexOf(slide);
                  return Container(
                    width: 80,
                    height: 8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: _currentIndex == index
                          ? const Color(0xff0073E8)
                          : const Color(0xffbde0fe),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: _slides,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentIndex != _slides.length - 1
                      ? Text(
                          'Skip',
                          style: GoogleFonts.roboto(
                            color: const Color(0xff0073E8),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => const NextScreen()), // Replace with your next screen
                          //   );
                          // },
                        )
                      : const SizedBox.shrink(),
                  GestureDetector(
                    onTap: _onNextPressed,
                    child: _currentIndex == _slides.length - 1
                        ? Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: const Color(0xff0073E8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Center(
                              child: Text(
                                'GET STARTED',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xff0073E8),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
