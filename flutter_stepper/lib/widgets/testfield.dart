import 'package:flutter/material.dart';

class TextFieldWithBorder extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final int? maxLength;
  final double? height;
  final double? width;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;

  const TextFieldWithBorder(
      {Key? key,
      required this.hintText,
      required this.textEditingController,
      this.maxLength,
      this.height,
      this.width,
      this.prefix,
      this.suffix,
      this.suffixIcon,
      this.maxLines,
      this.minLines,
      this.validation,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //A Single textField widget which can be used throughout the app

    return Container(
      width: width, height: height,
      //color: AppColors.containerBlack,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1.5,color: AppColors.yellowBorder,style: BorderStyle.solid)),
      child: TextFormField(
        autocorrect: true,
        onChanged: onChanged,
        controller: textEditingController,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: AppColors.grey),

        textAlign: TextAlign.start,
        decoration: InputDecoration(
            helperText: '',
            filled: true,
            fillColor: AppColors.colorLightSecondary,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w100,
                ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.yellowBorder),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: AppColors.yellowBorder),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.yellowBorder),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.yellowBorder),
                borderRadius: BorderRadius.circular(10)),
            errorStyle: TextStyle(height: 0)),
        minLines: minLines,
        maxLines: maxLines,
        validator: validation,
      ),
    );
  }
}

class AppColors {
  // Light Color
  static const Color yellowBorder = Color(0xffffdd00);
  static const Color colorLightSecondary = Color(0xFF0C0C0C);
  static const Color grey = Color(0xffffffff);
  // #Light Color

// Light Color
  static const Color colorDarkPrimary = Color(0xFF222831);
  static const Color colorDarkSecondary = Color(0xFF30475E);
  static const Color colorDarkThird = Color(0xFFF2A365);
  static const Color colorDarkTitle = Color(0xFFECECEC);
  // #Light Color

  // Get Started
  static const Color colorStarted = Color(0xFF274C71);
  static const Color colorStartedTitle = Color(0xFF352641);
  static const Color colorStartedDescription = Color(0xFF767676);
  static const Color colorStartedShadow = Color(0x60274C71);
  // #Get Started

  // Alert Dialog
  static const Color colorAlertDialogBack = Color(0xFFF8F7F2);
// #Alert Dialog

}

class TextFieldWithoutBorder extends StatelessWidget {
  final String? hintText;
  final TextEditingController textEditingController;
  final int? maxLength;
  final double? height;
  final double? width;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyBoardType;
  final Widget? label;
  //final TextStyle? labelStyle;
  final String? labelText;
  final String? Function(String?)? validation;

  const TextFieldWithoutBorder({
    Key? key,
    this.hintText,
    required this.textEditingController,
    this.maxLength,
    this.height,
    this.width,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.keyBoardType,
    this.label,
    this.labelText,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: AppColors.colorStartedDescription,
        // border: Border.all(color: AppColors.yellowBorder,width: 1.5,style: BorderStyle.solid)
      ),
      //color: AppColors.containerFill,
      child: TextFormField(
        controller: textEditingController,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: AppColors.colorLightSecondary,
            ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: AppColors.grey, fontWeight: FontWeight.w100),
            label: label,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.grey, fontWeight: FontWeight.w100),
            labelText: labelText,
            contentPadding: EdgeInsets.fromLTRB(4, 2, 0, 0)),
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyBoardType,
        validator: validation,
      ),
    );
  }
}

// Container(width: 324,height: 58,
// child: TextFormField(
// style: GoogleFonts.poppins(
// textStyle: TextStyle(color: AppColors.text)
// ),textAlign: TextAlign.center,
// decoration: InputDecoration(
// hintText: 'Mobile Number',
// hintStyle: GoogleFonts.poppins(color: AppColors.text),
//
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(width: 2,color: AppColors.yellow),
// borderRadius: BorderRadius.circular(10)
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(width: 2, color: AppColors.yellow),
// borderRadius: BorderRadius.circular(10)
// )
// ),
// ),),
