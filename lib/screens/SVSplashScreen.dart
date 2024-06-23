import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/screens/auth/screens/SVSignInScreen.dart';
import 'package:prokit_socialv/screens/walk_through_screen.dart';
import 'package:prokit_socialv/utils/SVConstants.dart';

class SVSplashScreen extends StatefulWidget {
  const SVSplashScreen({Key? key}) : super(key: key);

  @override
  State<SVSplashScreen> createState() => _SVSplashScreenState();
}

class _SVSplashScreenState extends State<SVSplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    Walkthrough().launch(context, isNewTask: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'images/socialv/svSplashImage.jpg',
            height: context.height(),
            width: context.width(),
            fit: BoxFit.fill,
          ),
          Image.asset(
            'images/socialv/alarrt_white_logo_with_text.png',
            height: 130,
            width: MediaQuery.of(context).size.width * .7,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
