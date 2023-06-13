import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTimeWidget extends StatelessWidget {
  CustomDateTimeWidget({
    Key? key,
    required this.controller,
    this.validator,
    required this.hinttext,
  }) : super(key: key);

  final TextEditingController controller;
  FormFieldValidator? validator;
  final hinttext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10)
      ),

      // padding: EdgeInsets.all(15),

        child: TextFormField(
          controller: controller,
          validator: validator,


          //editing controller of this TextField
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white,fontSize: 15,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
          decoration: InputDecoration(

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),

            // suffixIcon: Padding(
            //   padding: const EdgeInsets.only(right: 50, left: 35),
            //   child: Icon(
            //     Icons.calendar_today,
            //     color: AppColors.grey,
            //   ),
            // ),
            filled: true,
            fillColor: Color(0xff262626),
            hintText: hinttext,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Color(0XFFFFFFFF).withOpacity(0.6),
                fontSize: 15,
                fontWeight: FontWeight.w400),

            suffixIcon: Icon(Icons.calendar_today_sharp,color: Color(0xffffffff).withOpacity(0.6),),
            // labelText: "yyyy/mm/dd" //label text of field
          ),
          readOnly: true, //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    1950), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement
              controller.text = formattedDate;
              // setState(() {

              //   print(
              //       "Collected Date = ${dobController.toString()}"); //set output date to TextField value.
              // });
            } else {
              print("Date is not selected");
            }
          },
        ));
  }
}
