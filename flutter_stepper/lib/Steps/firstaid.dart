import 'package:flutter/material.dart';

import '../widgets/testfield.dart';

class Firstaid extends StatelessWidget {
  //const _Firstaid({Key? key}) : super(key: key);

  TextEditingController bloodgroup= TextEditingController();
  TextEditingController allergy= TextEditingController();
  TextEditingController othermed= TextEditingController();
  TextEditingController skills= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWithBorder(hintText: 'Blood Group', textEditingController: bloodgroup,
          height: 86,width: 298,),
        SizedBox(height: 10),
        TextFieldWithoutBorder(textEditingController: allergy,minLines: 1,maxLines: 5,
            height: 170,width: 298,hintText: 'Allergies & anaphylaxis', ),
        SizedBox(height: 10),
        TextFieldWithoutBorder(textEditingController: othermed,minLines: 1,maxLines: 5,
          height: 170,width: 298,hintText: 'other medical condition info', ),
        SizedBox(height: 10),

        TextFieldWithoutBorder(hintText: 'First aid Skill', textEditingController: skills,
          height: 150,width: 298,minLines: 1,maxLines: 5,),
      ],
    );
  }

}
