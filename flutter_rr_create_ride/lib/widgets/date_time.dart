import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter_rr_create_ride/widgets/inputfield_with_border.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class BasicDateTimeField extends StatelessWidget {
  final Widget? label;
  final String? hintText;
  final double? height;
  final double? width;
  final String? Function(DateTime?)? validation;

  BasicDateTimeField({
    Key? key,
    this.hintText,
    this.label,
    this.height,
    this.width,
    this.validation
  }) : super(key: key);

  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: AppColors.containerFill,
          // border: Border.all(color: AppColors.yellowBorder,width: 1.5,style: BorderStyle.solid)
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: DateTimeField(
            validator: validation,
            decoration: InputDecoration(
            //fillColor: Colors.amberAccent,
            //label: Text('Date of Birth',style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),),
            label: label,

            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                color: AppColors.grey, fontWeight: FontWeight.w100),
            border: InputBorder.none,
            prefixIcon:Icon(Icons.date_range_sharp,color: Colors.white,) ,
            contentPadding: EdgeInsets.fromLTRB(4, 2, 0, 0),
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.grey, fontWeight: FontWeight.w100),
          ),

            format: format,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: AppColors.white,
            ),
            onShowPicker: (context, currentValue) async {
              return await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100),

              ).then((DateTime? date) async {
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              });
            },
          ),
        ),
      ),
    ]);
  }
}
