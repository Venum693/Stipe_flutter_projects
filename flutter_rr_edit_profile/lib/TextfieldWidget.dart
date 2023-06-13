import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final int? maxLength;

  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;

  const DescriptionBox(
      {Key? key,
        required this.hintText,
        required this.textEditingController,
        this.maxLength,
        this.prefix,
        this.suffix,
        this.suffixIcon,
        this.maxLines,
        this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //A Single textField widget which can be used throughout the app

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('Width = ${screenWidth / 1.2} Height = ${screenHeight * 0.065}');

    return Container(
      width: screenWidth,
      height: screenHeight * .15,
      color: Color(0xff262626),
      child: TextFormField(
        controller: textEditingController,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          // filled: true,
          // fillColor: AppColors.containerFill,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
        ),
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}

///<<<<<<-------------DescriptionBox

class TextFieldWithoutBorder extends StatelessWidget {
  final String hintText;
  String? helperText;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final double? height;
  // final double width;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  String? initialValue;
  String? label;
  bool readOnly;
  double? textScale;

  TextFieldWithoutBorder(
      {Key? key,
        required this.hintText,
        this.textEditingController,
        this.maxLength,
        this.label,
        this.helperText,
        this.height,
        this.readOnly = false,

        // required this.width,
        this.prefix,
        this.suffix,
        this.suffixIcon,
        this.maxLines,
        this.minLines,
        this.keyboardType,
        this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: Color(0xff262626),
        // border: Border.all(color: AppColors.yellowBorder,width: 1.5,style: BorderStyle.solid)
      ),
      //color: AppColors.containerFill,
      child: TextFormField(
        initialValue: initialValue,
        controller: textEditingController,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
          color: Colors.white,
        ),
        // changed for edit profile
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          helperText: helperText,
          border: InputBorder.none,
          hintText: hintText,
          //changed for edit profile
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Color(0XFFFFFFFF).withOpacity(0.6), fontWeight: FontWeight.w400),
        ),
        minLines: 1,
        maxLines: 5,
        keyboardType: keyboardType,
        readOnly: readOnly,

        // initialValue: textEditingController.toString(),
      ),
    );
  }
}
