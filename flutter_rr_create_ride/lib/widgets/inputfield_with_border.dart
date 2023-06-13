import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
//import 'package:real_roadies/ride_captain/configs/app_colors.dart';

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
        onChanged: onChanged,
        controller: textEditingController,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: AppColors.text),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            helperText: '',
            filled: true,
            // fillColor: AppColors.containerFill,
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
                borderSide: BorderSide(width: 1.5, color: AppColors.yellow),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.yellowBorder),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.yellow),
                borderRadius: BorderRadius.circular(10)),
            errorStyle: TextStyle(height: 0)),
        minLines: minLines,
        maxLines: maxLines,
        validator: validation,
      ),
    );
  }
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
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyBoardType;
  final Widget? label;
  //final TextStyle? labelStyle;
  final String? labelText;
  final String? Function(String?)? validation;
  final String? Function(String?)? onChanged;

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
    this.onChanged,
    this.prefixIcon,
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
        color: AppColors.containerFill,
        // border: Border.all(color: AppColors.yellowBorder,width: 1.5,style: BorderStyle.solid)
      ),
      //color: AppColors.containerFill,
      child: TextFormField(
        onChanged: onChanged,
        controller: textEditingController,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          color: AppColors.text,
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(

            border: InputBorder.none,

            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                color: AppColors.grey, fontWeight: FontWeight.w100),
            label: label,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.grey, fontWeight: FontWeight.w100),
            labelText: labelText,
            contentPadding: EdgeInsets.fromLTRB(8, 2, 0, 0)),
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
