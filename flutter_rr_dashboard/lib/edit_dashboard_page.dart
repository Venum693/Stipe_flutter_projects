import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_dashboard_container_widget.dart';

class EditdashBoardPAge extends StatefulWidget {
  const EditdashBoardPAge({Key? key}) : super(key: key);

  @override
  State<EditdashBoardPAge> createState() => _EditdashBoardPAgeState();
}

class _EditdashBoardPAgeState extends State<EditdashBoardPAge> {

  TextEditingController numberofrides= TextEditingController();
  TextEditingController numberofKms= TextEditingController();
  TextEditingController numberofsolorides= TextEditingController();
  TextEditingController numberofKmsinsolo= TextEditingController();
  TextEditingController numberofgrouprides= TextEditingController();
  TextEditingController numberofgroupKms= TextEditingController();
  TextEditingController numberofcaptainrides= TextEditingController();
  TextEditingController numberofKmsCaptain= TextEditingController();
  TextEditingController Avgkmsperride= TextEditingController();
  TextEditingController Avgkmspersoloride= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.arrow_back_outlined, color: Colors.white),
        backgroundColor: Colors.black,
        title: Text('Edit Dashboard', style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Edit_dashboard_Container(
              headtitle: 'Rides This Month', describer1: 'No. of Rides',
              describer2: 'No. of Kms', colorvalue: 0xff000000,
              textEditingController1: numberofrides,
              textEditingController2: numberofKms, opacityvalue: 0.0,),
            Edit_dashboard_Container(
              headtitle: 'Solo Rides', describer1: 'No. of Solo Rides',
              describer2: 'No. of Kms', colorvalue: 0xff676767,
              textEditingController1: numberofsolorides,
              textEditingController2: numberofKmsinsolo, opacityvalue: 0.15,),
            Edit_dashboard_Container(
              headtitle: 'Group Ride', describer1: 'No. of Group Rides',
              describer2: 'No. of Kms', colorvalue: 0xff000000,
              textEditingController1: numberofgrouprides,
              textEditingController2: numberofgroupKms, opacityvalue: 0,),
            Edit_dashboard_Container(
              headtitle: 'Captain Ride', describer1: 'No. of Rides as Captain',
              describer2: 'No. of Kms', colorvalue: 0xff676767,
              textEditingController1: numberofcaptainrides,
              textEditingController2: numberofKmsCaptain, opacityvalue: 0.15,),
            Edit_dashboard_Container(
              headtitle: 'Avg Km per Ride', describer1: 'Avg Kms per Ride',
              describer2: 'Avg Kms per Solo Rides', colorvalue: 0xff000000,
              textEditingController1: Avgkmsperride,
              textEditingController2: Avgkmspersoloride, opacityvalue: 0,),
          ],
        ),
      ),
    );
  }
}


class Edit_dashboard_Container extends StatelessWidget {

  final String headtitle;
  final String describer1;
  final String describer2;
  final int colorvalue;
  final double opacityvalue;
  final TextEditingController? textEditingController1;
  final TextEditingController? textEditingController2;



  const Edit_dashboard_Container({Key? key,
    required this.headtitle,
    required this.describer1,
    required this.describer2,
    required this.colorvalue,
    required this.textEditingController1,
    required this.textEditingController2,
    required this.opacityvalue,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var s =MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height/3.6089;
    print('Width is $s and height is $h');


    return Container(
      color: Color(colorvalue).withOpacity(opacityvalue),
      width: 375 ,
      height: 164,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${headtitle}',style: GoogleFonts.poppins(
                  fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)
              ),),
              const SizedBox(height: 21,),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text('$describer1',style: GoogleFonts.poppins(
                          fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF).withOpacity(0.6)
                      ),),
                    ),
                    Container(
                      width: 135,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff262626)
                      ),
                      child: TextFieldWithoutBorder(
                        hintText: '',
                        keyboardType: TextInputType.number,
                        //initialValue: '0',
                        textEditingController: textEditingController1,

                      ),
                    )

                    /*Container(
                      width: 135,
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff262626)
                      ),
                      child: TextField(
                        controller: textEditingController1,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0.0),
                            border: InputBorder.none,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
              SizedBox(height: 19,),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text('${describer2}',style: GoogleFonts.poppins(
                          fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF).withOpacity(0.6)
                      ),
                      ),
                    ),
                    Container(
                      width: 135,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color: Color(0xff262626),
                      ),
                      child: TextFormField(
                        //textAlignVertical: TextAlignVertical.center,
                        //initialValue: "0",
                        controller: textEditingController2,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        minLines: 1,
                        style: TextStyle(color: Colors.white,fontSize: 15,),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          color: Color(0xfff2f2f2),
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          helperText: helperText,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Color(0xffb0b0b0), fontWeight: FontWeight.w400),
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
