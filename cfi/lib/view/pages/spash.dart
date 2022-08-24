import 'package:cfi/view/pages/scoundscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000 ,));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FadeTransition(
        opacity: fadingAnimation,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              "assets/images/ai.jpg",
              fit: BoxFit.cover,
            )),
          ],
        ),
      )),
    );
  }
}

void goToNextView() {
  Future.delayed(Duration(seconds: 5), () {
    Get.to(() => secoundScreen(), transition: Transition.fade);
  });
}
