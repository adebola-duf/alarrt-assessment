import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/screens/auth/components/SVLoginInComponent.dart';
import 'package:prokit_socialv/screens/auth/components/SVSignUpComponent.dart';
import 'package:prokit_socialv/utils/SVCommon.dart';
import 'package:prokit_socialv/utils/SVConstants.dart';
import 'package:prokit_socialv/main.dart';

import '../../../utils/SVColors.dart';

class SVSignInScreen extends StatefulWidget {
  const SVSignInScreen({Key? key}) : super(key: key);

  @override
  State<SVSignInScreen> createState() => _SVSignInScreenState();
}

class _SVSignInScreenState extends State<SVSignInScreen> {
  bool doRemember = false;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(svGetScaffoldColor());
    });
  }

  Widget getFragment() {
    if (selectedIndex == 0)
      return SVLoginInComponent(
        callback: () {
          selectedIndex = 1;
          setState(() {});
        },
      );
    else
      return SVSignUpComponent(
        callback: () {
          selectedIndex = 0;
          setState(() {});
        },
      );
  }

  @override
  void dispose() {
    setStatusBarColor(svGetScaffoldColor());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.statusBarHeight + 50),
          Image.asset(
            'images/socialv/alarrt_blue_logo_with_text.png',
            height: 90,
            fit: BoxFit.cover,
          ),
          40.height,
          svHeaderContainer(
            context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('LOGIN',
                      style: boldTextStyle(
                          color: selectedIndex == 0
                              ? Colors.white
                              : Colors.white54,
                          size: 16)),
                  onPressed: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                ),
                TextButton(
                  child: Text('SIGNUP',
                      style: boldTextStyle(
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.white54,
                          size: 16)),
                  onPressed: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          getFragment().expand(),
        ],
      ),
    );
  }
}
