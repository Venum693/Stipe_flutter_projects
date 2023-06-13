import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'TextfieldWidget.dart';
import 'date_and_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  TextEditingController dobcontroller = TextEditingController();
  TextEditingController Dlvalidity = TextEditingController();

  var currentSelectedValue;
  var currentSelectedValue1;
  List<DropdownMenuItem<String>> GenderTypes = [
    DropdownMenuItem(child: Text("Male"),value:"Male", ),
    DropdownMenuItem(child: Text("Female"),value: "Female",),
    DropdownMenuItem(child: Text("Others"),value: "Others",)
  ];

  final blood_grp = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  bool firstvalue = false;

  List<String> _items = [
    'Maintenance',
    'Chain Repair',
    'Cleaning',
    'Flat Tyre',
    'Adjustments'
  ];

  List<bool> _checkedItems = [];

  @override
  void initState() {
    super.initState();
    _checkedItems = List<bool>.filled(_items.length, false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Edit Profile',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700
                //TODO Trailing Icon
            )),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Personal Information',style: GoogleFonts.poppins(fontSize: 16,
                fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),),
              SizedBox(height: 4,),
              TextFieldWithoutBorder(hintText: 'Name',),
              SizedBox(height: 12,),
              TextFieldWithoutBorder(hintText: 'Bio',),
              SizedBox(height: 12,),
              CustomDateTimeWidget(
                controller: dobcontroller,
                hinttext: 'Date Of Birth '),
              SizedBox(height: 12,),
              Container(
                  alignment: Alignment(0,0),
                  decoration: BoxDecoration(
                    color: Color(0xff262626),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,dropdownColor: Color(0xff262626),
                      style: TextStyle(color: Color(0xffFFFFFF).withOpacity(0.6)),
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: currentSelectedValue,
                      items: GenderTypes,
                      isExpanded: true,
                      hint: Text("Gender", textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(color: Color(0XFFFFFFFF).withOpacity(0.6),
                            fontSize: 16),),
                      onChanged: (value) {
                        setState(() {
                          currentSelectedValue = value;
                          print(value);
                        });
                      },
                    ),
                  )
              ),
              SizedBox(height: 12,),
              TextFieldWithoutBorder(hintText: "Email Address"),
              SizedBox(height: 34,),
              Text('Driving License Information',style: GoogleFonts.poppins(fontSize: 16,
                  fontWeight: FontWeight.w500,color: Color(0xffFFFFFF))),
              SizedBox(height: 4,),
              TextFieldWithoutBorder(hintText: 'DL No.'),
              SizedBox(height: 12,),

              CustomDateTimeWidget(
                  controller: Dlvalidity,
                  hinttext: 'Valid Till'),

              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Blood Group',style: GoogleFonts.poppins(fontSize: 16,
                      fontWeight: FontWeight.w500,color: Color(0xffFFFFFF))),
                  RichText(text: TextSpan(
                      style: GoogleFonts.poppins(fontSize: 8,
                          fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),
                    children: <TextSpan>[
                      TextSpan(text: "Check your DL's back for blood type "),
                      TextSpan(text: '*',style: GoogleFonts.poppins(fontSize: 10,
                          fontWeight: FontWeight.w500,color: Color(0xffFF0000))),
                    ],
                  )),
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 13),

                // height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff262626),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                      decoration: InputDecoration.collapsed(
                        hintText: '',
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(
                        color: Colors.white,
                      ),
                      dropdownColor: Color(0xff262626),
                      //menuMaxHeight: 300,
                      hint: Text("Blood Type",textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.grey)),
                      isExpanded: true,
                      value: currentSelectedValue1,
                      items: blood_grp
                          .map(buildMenuItemBloodGrp)
                          .toList(),
                      onChanged: (value) {
                        currentSelectedValue1=value;
                      }),
                ),
              ),
              SizedBox(height: 24,),
              Text("Mechanical Skills",style: GoogleFonts.poppins(
                  fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),),

              SizedBox(height: 8,),
              /*Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      value: firstvalue,
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          firstvalue= value!;
                        });
                      },),
                  ),
                  Text('Maintainence',style: GoogleFonts.poppins(fontSize: 13,
                  fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF).withOpacity(0.6))),
                  Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      value: firstvalue,
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          firstvalue= value!;
                        });
                      },),
                  ),
                  Text('Chain Repair',style: GoogleFonts.poppins(fontSize: 13,
                      fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF).withOpacity(0.6))),
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      value: firstvalue,
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          firstvalue= value!;
                        });
                      },),
                  ),
                  Text('Cleaning',style: GoogleFonts.poppins(fontSize: 13,
                      fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF).withOpacity(0.6))),
                  Transform.scale(
                    scale: 2,
                    child: Checkbox(
                      value: firstvalue,
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          firstvalue= value!;
                        });
                      },),
                  ),
                  Text('Flat Tyre',style: GoogleFonts.poppins(fontSize: 13,
                      fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF).withOpacity(0.6))),
                ],
              )*/
              Container(
                height: 350,
                child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context,index) {
                      return CheckboxListTile(
                         //checkboxShape: RoundedRectangleBorder(),
                          title: Text(_items[index],style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,fontSize: 16,
                            color: Color(0xffffffff).withOpacity(0.6)
                          ),),
                          value: _checkedItems[index],
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              _checkedItems[index] = value!;
                            });
                          }
                          );
                    }
                 ),
              )
            ],
          ),
        ),
      ),
    );
  }



  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.focused,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff262626);
    }
    return Color(0xfffff626);
  }
}

DropdownMenuItem<String> buildMenuItemBloodGrp(String item) {
  return DropdownMenuItem(
    value: item,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Text(
          item,
          textScaleFactor: 1.1,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    ),
  );
}
