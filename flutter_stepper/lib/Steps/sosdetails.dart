import 'package:flutter/material.dart';

import '../widgets/testfield.dart';
class Sosdetails extends StatelessWidget {
  TextEditingController name1= TextEditingController();
  TextEditingController Mobile1= TextEditingController();
  TextEditingController name2= TextEditingController();
  TextEditingController mobile2= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWithBorder(hintText: 'Name', textEditingController: name1,
          height: 52,width: 298,),
        TextFieldWithBorder(hintText: 'Mobile', textEditingController: Mobile1,
          height: 98,width: 298,),
        TextFieldWithBorder(hintText: 'Name', textEditingController: name2,
          height: 98,width: 298,),
        TextFieldWithBorder(hintText: 'Mobile', textEditingController: mobile2,
          height: 98,width: 298,),
      ],
    );
  }
  }