import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/screens/SVDashboardScreen.dart';
import 'package:prokit_socialv/utils/SVColors.dart';
import 'package:prokit_socialv/utils/SVCommon.dart';

class SVSignUpComponent extends StatefulWidget {
  final VoidCallback? callback;

  SVSignUpComponent({this.callback});

  @override
  State<SVSignUpComponent> createState() => _SVSignUpComponentState();
}

class _SVSignUpComponentState extends State<SVSignUpComponent> {
  bool _checkBoxMarked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      color: context.cardColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Sign Up', style: boldTextStyle(size: 24))
                .paddingSymmetric(horizontal: 16),
            8.height,
            Text('Use your active 11 digits number for SMS delivery.Additional free points are awarded to you when you sign up using a referral code.',
                    style: secondaryTextStyle(
                        weight: FontWeight.w500, color: svGetBodyColor()))
                .paddingSymmetric(horizontal: 16),
            Container(
              child: Column(
                children: [
                  30.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: Icon(Icons.person_outlined),
                      label: 'Your First Name',
                      labelStyle: secondaryTextStyle(
                        weight: FontWeight.w600,
                        color: svGetBodyColor(),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: Icon(Icons.person_outlined),
                      label: 'Last Name',
                      labelStyle: secondaryTextStyle(
                        weight: FontWeight.w600,
                        color: svGetBodyColor(),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.USERNAME,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Text('@'),
                        ),
                      ),
                      label: 'Preferred Username',
                      labelStyle: secondaryTextStyle(
                          weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: Icon(Icons.phone_outlined),
                      label: 'Active Phone',
                      labelStyle: secondaryTextStyle(
                        weight: FontWeight.w600,
                        color: svGetBodyColor(),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: Icon(Icons.email_outlined),
                      label: 'Your Email',
                      labelStyle: secondaryTextStyle(
                          weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    textStyle: boldTextStyle(),
                    suffixIconColor: svGetBodyColor(),
                    suffixPasswordInvisibleWidget: Image.asset(
                            'images/socialv/icons/ic_Hide.png',
                            height: 16,
                            width: 16,
                            fit: BoxFit.fill)
                        .paddingSymmetric(vertical: 16, horizontal: 14),
                    suffixPasswordVisibleWidget:
                        svRobotoText(text: 'Show', color: SVAppColorPrimary)
                            .paddingOnly(top: 20),
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Text('**'),
                        ),
                      ),
                      label: 'Your Password',
                      labelStyle: secondaryTextStyle(
                          weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.NUMBER,
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      prefixIcon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Text('@'),
                        ),
                      ),
                      label: 'Referrer Code',
                      labelStyle: secondaryTextStyle(
                          weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    decoration: svInputDecoration(
                      context,
                      useOutlineinputBorder: true,
                      suffixIcon: RotatedBox(
                        quarterTurns: 3,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      label: 'Country',
                      labelStyle: secondaryTextStyle(
                        weight: FontWeight.w600,
                        color: svGetBodyColor(),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value:
                            _checkBoxMarked, // Replace with your checkbox value
                        onChanged: (bool? value) {
                          setState(() {
                            _checkBoxMarked = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Wrap(
                          children: <Widget>[
                            Text(
                              'I agree to receive real time alert notifications via email and sms.\n\nPROCEEDING WITH THE REGISTRATION MEANS YOU\'VE ACCEPTED OUR TERMS AND CONDITIONS',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  80.height,
                  svAppButton(
                    context: context,
                    text: 'SIGN UP',
                    onTap: () {
                      SVDashboardScreen().launch(context);
                    },
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      svRobotoText(text: 'Already Have An Account?'),
                      4.width,
                      Text(
                        'Sign In',
                        style: secondaryTextStyle(
                            color: SVAppColorPrimary,
                            decoration: TextDecoration.underline),
                      ).onTap(() {
                        widget.callback?.call();
                      },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent)
                    ],
                  ),
                  50.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
