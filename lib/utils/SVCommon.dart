import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/main.dart';
import 'package:prokit_socialv/screens/addPost/components/SVSharePostBottomSheetComponent.dart';
import 'package:prokit_socialv/utils/SVColors.dart';
import 'package:prokit_socialv/utils/SVConstants.dart';

InputDecoration svInputDecoration(
  BuildContext context, {
  String? hint,
  String? label,
  TextStyle? hintStyle,
  TextStyle? labelStyle,
  Widget? prefix,
  EdgeInsetsGeometry? contentPadding,
  Widget? prefixIcon,
  bool? useOutlineinputBorder,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    contentPadding: contentPadding,
    labelText: label,
    hintText: hint,
    hintStyle: hintStyle ?? secondaryTextStyle(),
    labelStyle: labelStyle ?? secondaryTextStyle(),
    prefix: prefix,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    enabledBorder: useOutlineinputBorder == true
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: SVAppBorderColor),
          ),
    focusedBorder: useOutlineinputBorder == true
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: SVAppColorPrimary),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: SVAppColorPrimary),
          ),
    focusedErrorBorder: useOutlineinputBorder == true
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
    errorBorder: useOutlineinputBorder == true
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red))
        : UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
    alignLabelWithHint: true,
  );
}

Widget svRobotoText(
    {required String text,
    Color? color,
    FontStyle? fontStyle,
    Function? onTap,
    TextAlign? textAlign}) {
  return Text(
    text,
    style: secondaryTextStyle(
      fontFamily: svFontRoboto,
      color: color ?? svGetBodyColor(),
      fontStyle: fontStyle ?? FontStyle.normal,
    ),
    textAlign: textAlign ?? TextAlign.center,
  ).onTap(onTap,
      splashColor: Colors.transparent, highlightColor: Colors.transparent);
}

Color svGetBodyColor() {
  if (appStore.isDarkMode)
    return SVBodyDark;
  else
    return SVBodyWhite;
}

Color svGetScaffoldColor() {
  if (appStore.isDarkMode)
    return appBackgroundColorDark;
  else
    return SVAppLayoutBackground;
}

Widget svHeaderContainer(
    {required Widget child, required BuildContext context}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        width: context.width(),
        decoration: BoxDecoration(
            color: alarrtBlue,
            borderRadius: radiusOnly(
                topLeft: SVAppContainerRadius, topRight: SVAppContainerRadius)),
        padding: EdgeInsets.all(24),
        child: child,
      ),
      Container(
        height: 20,
        decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: radiusOnly(
                topLeft: SVAppContainerRadius, topRight: SVAppContainerRadius)),
      )
    ],
  );
}

Widget svAppButton(
    {required String text,
    required Function onTap,
    double? width,
    required BuildContext context}) {
  return AppButton(
    shapeBorder:
        RoundedRectangleBorder(borderRadius: radius(SVAppCommonRadius)),
    text: text,
    textStyle: boldTextStyle(color: Colors.white),
    onTap: onTap,
    elevation: 0,
    color: alarrtBlue,
    width: width ?? context.width() - 32,
    height: 56,
  );
}

Future<File> svGetImageSource() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.camera);
  return File(pickedImage!.path);
}

void svShowShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    backgroundColor: context.cardColor,
    shape: RoundedRectangleBorder(
        borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
    builder: (context) {
      return SVSharePostBottomSheetComponent();
    },
  );
}
