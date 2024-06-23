import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_socialv/utils/SVConstants.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(spacing_standard),
          topRight: Radius.circular(spacing_standard),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  // showShadow: true,
                  color: Color(0xffBBd2fc).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(spacing_standard)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffBBd2fc),
                        borderRadius: BorderRadius.circular(spacing_standard)),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Placeholder(),
                    ).paddingAll(spacing_standard_new),
                  ).paddingRight(spacing_standard_new),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("Paying"),
                        text("Electricity Bill",
                                fontSize: textSizeMedium,
                                textColor: t12_text_color_primary,
                                fontFamily: fontMedium)
                            .paddingTop(spacing_control_half),
                      ],
                    ),
                  ),
                  toolBarTitle("\$122.50").paddingTop(spacing_standard_new),
                ],
              ).paddingAll(spacing_standard),
            ).paddingBottom(spacing_standard_new),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(spacing_standard)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text("Subscriber ID", textColor: textPrimaryColor),
                  customFormField(context, "Your Subcriber Id",
                          prefixIcon: Icons.person_outline)
                      .paddingTop(spacing_standard),
                  text("Bill No", textColor: textPrimaryColor)
                      .paddingTop(spacing_standard),
                  customFormField(context, "Enter the bill number",
                          prefixIcon: Icons.device_unknown)
                      .paddingTop(spacing_standard),
                  text("Amount", textColor: textPrimaryColor)
                      .paddingTop(spacing_standard),
                  customFormField(context, "Enter the amount",
                          prefixIcon: Icons.attach_money)
                      .paddingTop(spacing_standard),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      padding: EdgeInsets.only(
                          top: spacing_standard_new,
                          bottom: spacing_standard_new),
                      child: text("Pay Now",
                          textColor: Colors.white, fontFamily: fontMedium),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(spacing_standard)),
                      color: t12_primary_color,
                      onPressed: () => {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(spacing_standard),
                                        topRight:
                                            Radius.circular(spacing_standard))),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.all(spacing_standard_new),
                                      decoration: BoxDecoration(
                                          color: Color(0xfff1f4fb)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffBBd2fc),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      spacing_standard),
                                            ),
                                            child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Placeholder(),
                                            ).paddingAll(spacing_standard_new),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                text("Paying"),
                                                text(
                                                  "Electricity Bill",
                                                  fontSize: textSizeMedium,
                                                  textColor:
                                                      t12_text_color_primary,
                                                  fontFamily: fontMedium,
                                                ).paddingTop(
                                                    spacing_control_half),
                                              ],
                                            ),
                                          ),
                                          toolBarTitle("\$122.50")
                                              .paddingTop(spacing_standard_new),
                                        ],
                                      ).paddingAll(spacing_standard_new),
                                    ),
                                  ],
                                ).paddingAll(spacing_standard_new),
                              );
                            })
                      },
                    ),
                  ).paddingTop(spacing_standard_new)
                ],
              ).paddingAll(spacing_standard_new),
            )
          ],
        ).paddingOnly(
          top: spacing_standard_new,
          left: spacing_standard_new,
          right: spacing_standard_new,
          bottom: max(
              spacing_standard_new, MediaQuery.of(context).viewInsets.bottom),
        ),
      ),
    );
  }

  Widget customFormField(context, hint,
      {isEnabled = true,
      isDummy = false,
      controller,
      isPasswordVisible = false,
      isPassword = false,
      keyboardType = TextInputType.text,
      FormFieldValidator<String>? validator,
      onSaved,
      textInputAction = TextInputAction.next,
      FocusNode? focusNode,
      FocusNode? nextFocus,
      IconData? suffixIcon,
      IconData? prefixIcon,
      maxLine = 1,
      suffixIconSelector}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? isPasswordVisible : false,
      cursorColor: t12_primary_color,
      maxLines: maxLine,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (arg) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(spacing_standard),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(spacing_standard),
            borderSide: BorderSide(color: Colors.transparent)),
        filled: true,
        fillColor: t12_edittext_background,
        hintText: hint,
        hintStyle:
            TextStyle(fontSize: textSizeMedium, color: t12_text_secondary),
        prefixIcon: Icon(
          prefixIcon,
          color: t12_text_secondary,
          size: 20,
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: suffixIconSelector,
                child: new Icon(
                  suffixIcon,
                  color: t12_text_secondary,
                  size: 20,
                ),
              )
            : Icon(
                suffixIcon,
                color: t12_text_secondary,
                size: 20,
              ),
      ),
      style: TextStyle(
        fontSize: textSizeNormal,
        color: isDummy ? Colors.transparent : t12_text_color_primary,
        fontFamily: fontRegular,
      ),
    );
  }

  Widget toolBarTitle(var title, {textColor = t12_text_color_primary}) {
    return Text(
      title,
      style: TextStyle(
          fontSize: textSizeNormal, fontFamily: fontBold, color: textColor),
    );
  }

  Widget text(String data,
      {double? fontSize, Color? textColor, String? fontFamily}) {
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontFamily: fontFamily,
      ),
    );
  }
}
