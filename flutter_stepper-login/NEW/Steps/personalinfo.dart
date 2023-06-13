import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/testfield.dart';
import 'package:intl/intl_browser.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';




class Personalinfo extends StatelessWidget {
  //const Personalinfo({Key? key}) : super(key: key);

  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController nickname=TextEditingController();
  TextEditingController dateInput = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWithBorder(hintText: 'First Name', textEditingController: firstname,
        height: 56,width: 298,),
        TextFieldWithBorder(hintText: 'Last Name', textEditingController: lastname,
          height: 56,width: 298,),
        TextFieldWithBorder(hintText: 'Nick Name', textEditingController: nickname,
          height: 56,width: 298,),

        TextField(

          controller: dateInput,
          decoration: InputDecoration(

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3, color: Colors.yellow
              )
            ),
            icon: Icon(Icons.calendar_month_sharp),
            labelText: "Date of Birth",
            hintText: "dd-mm-yyyy",
            hintStyle: TextStyle(color: Colors.white)
          ),
          //readOnly: true,

          onTap: () async{
            DateTime? pickedDate = await showDatePicker(

                context: context,
                initialDate:  DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100),
                helpText: "Date of Birth",
                confirmText: 'OK');

            if (pickedDate != null)
             {
               setState(){
                 dateInput.text= DateFormat('yyyy-mm-dd').format(pickedDate);
               }
             }
          },
        )
      ],
    );
  }
}