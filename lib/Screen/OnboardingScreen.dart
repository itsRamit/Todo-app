import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/screen/LoginScreen.dart';

const primaryColor = Color(0xFF5ae4a7);
const bgColor = Color(0xFFF5F5F5);
const secondaryColor = Color(0xFFFEFEFE);
const textColor = Color.fromARGB(255, 51, 67, 75);

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNextButtonPressed() {
    if (_currentIndex < 2) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: <Widget>[
                  _buildPage(
                    image: 'assets/images/image1.png',
                    title: 'Welcome to Our App',
                    description:
                        'This is a brief description of what our app does.',
                  ),
                  _buildPage(
                    image: 'assets/images/image2.png',
                    title: 'Track Your Progress',
                    description:
                        'Keep track of your tasks and progress easily.',
                  ),
                  _buildPage(
                    image: 'assets/images/image3.png',
                    title: 'Achieve Your Goals',
                    description: 'Set goals and achieve them with our app.',
                  ),
                ],
              ),
            ),
            _buildIndicator(),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String image,
      required String title,
      required String description}) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              // color: Colors.grey,
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: textColor),
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.all(4.0),
          width: _currentIndex == index ? 12.0 : 8.0,
          height: _currentIndex == index ? 12.0 : 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? primaryColor : bgColor,
          ),
        );
      }),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: CupertinoButton(
          color: primaryColor,
          onPressed: _onNextButtonPressed,
          borderRadius: BorderRadius.circular(20),
          child: Text(
            _currentIndex < 2 ? 'Next' : 'Get Started',
            style: TextStyle(color: text_color, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: bgColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        middle: Text('Next Screen', style: TextStyle(color: Colors.white)),
      ),
      child: Center(
        child: Text('Welcome to the next screen!',
            style: TextStyle(color: textColor)),
      ),
    );
  }
}
