import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widgets/testfield.dart';
//import 'package:intl/intl_browser.dart';

class Personalinfo extends StatefulWidget {
  const Personalinfo({Key? key}) : super(key: key);

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController nickname=TextEditingController();
  TextEditingController dateInput = TextEditingController();

  var currentSelectedValue;
  List<DropdownMenuItem<String>> GenderTypes = [DropdownMenuItem(child: Text("Male"),value:"Male" ),
    DropdownMenuItem(child: Text("Female"),value: "Female",),
    DropdownMenuItem(child: Text("Others"),value: "Others",)];




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFieldWithBorder(hintText: 'First Name', textEditingController: firstname,
            height: 86,width: 298,minLines: 1,maxLines: 1,),
          SizedBox(height: 10),
          TextFieldWithBorder(hintText: 'Last Name', textEditingController: lastname,
            height: 86,width: 298,minLines: 1,maxLines: 1,),
          SizedBox(height: 10),
          TextFieldWithBorder(hintText: 'Nick Name', textEditingController: nickname,
            height: 86,width: 298,minLines: 1,maxLines: 1,),
          SizedBox(height: 10),
          BasicDateTimeField(),
          SizedBox(height: 10),

          Container(
              alignment: Alignment(0,0),
               width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              //padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: currentSelectedValue,
                  items: GenderTypes,

                  hint: Text("Gender",style: GoogleFonts.poppins(fontSize: 16),),
                  onChanged: (value) {
                    setState(() {
                      currentSelectedValue = value;
                      print(value);
                    });
                  },
                ),
              )
          )

        ],
      ),
    );
  }
}


class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[

      DateTimeField(decoration: InputDecoration(
        //fillColor: Colors.amberAccent,
          label: Text('Date of Birth',style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),),
          filled: true,
        hintText:'dd-mm-yyyy',
          hintStyle: TextStyle(color: Colors.black12,fontSize: 20),
          border: InputBorder.none,
          suffixIcon:Icon(Icons.date_range_sharp,color: Colors.white,) ,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.yellowBorder),
              borderRadius: BorderRadius.circular(10)),
      ),

        format: format,
        style: TextStyle(color: Colors.white),
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
    ]);
  }
}
