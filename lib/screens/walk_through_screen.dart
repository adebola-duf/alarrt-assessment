import 'dart:core';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/data/walk_through_list.dart';
import 'package:prokit_socialv/utils/SVColors.dart';

import '../main.dart';
import 'auth/screens/SVSignInScreen.dart';
import 'alarrt_components/heading_text_component.dart';

class Walkthrough extends StatefulWidget {
  Walkthrough({Key? key}) : super(key: key);

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  List<WalkThroughModelClass> walkThroughLists = walkThroughList();
  PageController? pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    pageController = PageController(initialPage: 0);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.width(),
            height: context.height() / 2 + 48,
            padding: EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 128),
            decoration: BoxDecoration(
              color: alarrtBlue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(200)),
            ),
          ),
          PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              index = value.toInt();
              setState(() {});
            },
            itemCount: walkThroughLists.length,
            itemBuilder: (context, index) {
              return WalkthroughWidget(data: walkThroughLists[index]);
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => SVSignInScreen().launch(context),
                  child: Text("SKIP", style: boldTextStyle()),
                ),
                DotIndicator(
                  pageController: pageController!,
                  pages: walkThroughLists,
                  indicatorColor: indicatorAndButtoncolor,
                  unselectedIndicatorColor:
                      appStore.isDarkMode ? Colors.white60 : Colors.black12,
                ),
                Spacer(),
                AnimatedCrossFade(
                  firstChild: Container(
                    decoration: boxDecorationDefault(
                        shape: BoxShape.circle, color: indicatorAndButtoncolor),
                    child: IconButton(
                      onPressed: () {
                        pageController?.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.decelerate);
                      },
                      icon: Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.white),
                    ),
                  ),
                  secondChild: GestureDetector(
                    onTap: () => SVSignInScreen().launch(context),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration:
                          boxDecorationDefault(color: indicatorAndButtoncolor),
                      child: Text('Get Started',
                          style: boldTextStyle(color: Colors.white)),
                    ),
                  ),
                  crossFadeState: index == 2
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: 200.milliseconds,
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
