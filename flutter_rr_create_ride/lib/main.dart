

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rr_create_ride/widgets/app_colors.dart';
import 'package:flutter_rr_create_ride/widgets/date_time.dart';
import 'package:flutter_rr_create_ride/widgets/inputfield_with_border.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MapBox/Mapbox.dart';
import 'Models/create_ride_post_model.dart';
import 'Riverpod_providers/providers.dart';



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Roadies',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
        home: MyHomePage(),
    );
  }
}


//Riverpod provider that holds a bool value
final loading = StateProvider.autoDispose((ref) => false);

class MyHomePage extends ConsumerStatefulWidget {

  //const MyHomePage({super.key, this.title});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  var currentSelectedValue;
  List<DropdownMenuItem<String>> TerrainTypes = [
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value:"Hills",child: Text("Hills"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "Mountain",child: Text("Mountain"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "Beach",child: Text("Beach"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "Forest",child: Text("Forest"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "City",child: Text("City"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "Desert",child: Text("Desert"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "Jungle",child: Text("Jungle"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "Water",child: Text("Water"),),
    const DropdownMenuItem(alignment: AlignmentDirectional.center,value: "mixed",child: Text("Mixed"),)
    ];


  TextEditingController ridedetails= TextEditingController();
  TextEditingController description= TextEditingController();
  TextEditingController budget1= TextEditingController();
  TextEditingController budget2= TextEditingController();
  TextEditingController minpeople= TextEditingController();
  TextEditingController maxpeople= TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Dio dio = Dio(
    //BaseOptions(baseUrl: 'https://api-ecart-vendor.rotam.ai/')
  );
  final _baseUrl = 'https://api-ecart-vendor.rotam.ai/' ;

  String startMap = 'Tap to select start Location';
  String endMap = 'Tap to select Destination';


  updateAllRides() async {
    return ref.refresh(getAllRidesProvider);
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth=MediaQuery.of(context).size.width;
    var screenheight= MediaQuery.of(context).size.height;

    print("width:${screenwidth/1.049} and Height:${screenheight*0.061}");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
            leading: Icon(Icons.arrow_back_ios),
          iconTheme: const IconThemeData(
            color: AppColors.text
          ),
          title: Text('Create Ride',style: GoogleFonts.poppins(
              fontSize: 20,fontWeight: FontWeight.w700,
            color: AppColors.text
          )),
          centerTitle: true,
        ),

            //ADD CONSUMER PROVIDER HERE
      //Body : Consumer WIDgET
      /*builder: (context, ref, child) => {
                final loadingState = ref.watch(loading);
        return LoadingScreen(loading: loadingState, child: child!);
              }*/
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                children: [
                  Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      //Ride Details
                      SizedBox(height: 17),
                      Align(alignment: Alignment.topLeft,
                        child: Text('Ride Details' ,
                          style: GoogleFonts.poppins(color: Color(0xffF2F2F2),
                              fontSize: 16,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start),
                      ),
                      SizedBox(height: 12),

                      TextFieldWithoutBorder(textEditingController: ridedetails,
                        hintText: 'ridedetails',
                        width: screenwidth/1.049,height: screenheight*0.061,
                        validation: (value) {
                          if (value?.isEmpty == true) {
                            return 'This Field cannot be empty';
                          }
                        },
        ),
          SizedBox(height: 12),
          TextFieldWithoutBorder(textEditingController: description,
           hintText: 'Description', width: screenwidth/1.049,
                height: screenheight*0.061),
                  SizedBox(height: 12),
                  BasicDateTimeField(hintText: 'Launch Date and Time Selection',
                      width: screenwidth/1.049,
                      height: screenheight*0.061,
                      validation: (value) {
                        if (value == null) {
                          return 'This Field cannot be empty';
                        }
                      }),
                  SizedBox(height: 12),
                  BasicDateTimeField(
                      hintText: 'End Date and Time Selection',
                      width: screenwidth/1.049,
                      height: screenheight*0.061,
                      validation: (value) {
                        if (value == null) {
                          return 'This Field cannot be empty';
                        }
                      }),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text('Location' ,
                          style: GoogleFonts.poppins(color: AppColors.text,
                              fontSize: 16,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start
                          ),
                    ],
                  ),
                      GestureDetector(
                        onTap: () {
                          getStartAddressFromMap(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: AppColors.containerFill,
                              ),
                          height: screenheight * 0.061,
                          width: screenwidth / 1.049,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                ' Start Destination',
                                textScaleFactor: 1,
                                style: GoogleFonts.poppins(
                                    color: AppColors.text,
                                    fontSize: 16,fontWeight: FontWeight.w400),
                                maxLines: 3,
                              )),
                        ),
                      ),
                      SizedBox(height: 13),
                      GestureDetector(
                        onTap: () {
                          //This function Navigates the user to a Map to choose the Location
                          getDestinationAddressFromMap(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: AppColors.containerFill,
                              ),
                          height: screenheight * 0.061,
                          width: screenwidth / 1.0491,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(textAlign: TextAlign.start,
                                ' End Destination',
                                textScaleFactor: 1,
                                style: GoogleFonts.poppins(
                                    color: AppColors.text,
                                    fontSize: 16,fontWeight: FontWeight.w400),
                                maxLines: 3,
                              )),
                        ),
                      ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text('Terrain Type' ,
                          style: GoogleFonts.poppins(color: AppColors.text,
                              fontSize: 16,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                      alignment: Alignment(10,0),
                      width: screenwidth/1.049,
                      height: screenheight*0.071,
                      decoration: BoxDecoration(
                        color: AppColors.containerFill,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //padding: EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          style: GoogleFonts.poppins(color: Colors.white),
                          dropdownColor: AppColors.containerBlack,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.landscape_outlined)
                          ),
                          value: currentSelectedValue,
                          items: TerrainTypes,
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          iconSize: 20,
                          hint: Text("Please Select",style: GoogleFonts.poppins(
                              fontSize: 15,color: Colors.grey,height: 1),),
                          onChanged: (value) {
                            setState(() {
                              currentSelectedValue = value;
                              print(value);
                            });
                          },
                        ),
                      )
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text('Budget' ,
                          style: GoogleFonts.poppins(color: AppColors.text,
                              fontSize: 16,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                 TextFieldWithoutBorder(
                   hintText: 'With Fuel',
                    textEditingController: budget1,
                      width: screenwidth/1.049,
                      height: screenheight*0.061,
                    prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                    keyBoardType: TextInputType.number,
                    ),
                  SizedBox(height: 8),

                  TextFieldWithoutBorder(
                    hintText: 'Without Fuel',
                    textEditingController: budget2,
                    width: screenwidth/1.049,
                    height: screenheight*0.061,
                    prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                    keyBoardType: TextInputType.number,
                  ),
                  SizedBox(height: 24),

                  Row(
                    children: [
                      Text('Max & Min People' ,
                          style: GoogleFonts.poppins(color: AppColors.text,
                              fontSize: 16,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  TextFieldWithoutBorder(
                    hintText: 'Minimum',
                    textEditingController: minpeople,
                    width: screenwidth/1.049,
                    height: screenheight*0.061,
                    prefixIcon: Icon(Icons.emoji_people_sharp),
                    keyBoardType: TextInputType.number,
                  ),

                  SizedBox(height: 12),

                  TextFieldWithoutBorder(
                    hintText: 'Maximum',
                    textEditingController: maxpeople,
                    width: screenwidth/1.049,
                    height: screenheight*0.061,
                    prefixIcon: Icon(Icons.family_restroom_sharp),
                      keyBoardType: TextInputType.number,
                  ),
                  SizedBox(height: 24),

                  Container(
                    height: screenheight*0.0681,
                    width: screenwidth/1.049,
                    child: ElevatedButton(onPressed: (){
                      print('pressed elevated button');
                      createUser(
                          details: CreateRide(
                          customerName: ridedetails.text,
                          customerAddress: description.text,
                          customerPhone: budget1.text,
                            customerAadhar: budget2.text,
                          //customerEmail: budget2.toString(),
                          //customerAadhar: budget2.text,
                      ));
                    },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )),

                        child: Text('Create RRide' ,
                            style: GoogleFonts.poppins(color: Colors.black,
                                fontSize: 16,fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                  ),
                  SizedBox(height: 24),
                ],
                  ),
                )
        ]
      ),
              )
     )
    );
  }

  void getStartAddressFromMap(BuildContext context) async {
    final startResult = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapBoxScreen()));

    setState(() {
      //when the marker is tapped, the address is collected and displayed on the screen
      startMap = startResult;

      print('${startMap}');
    });
    // var res = await locationFromAddress(startMap);
    // var first = res.first;
    // print(first.latitude);
    // print('${first.longitude},,');
  }
  void getDestinationAddressFromMap(BuildContext context) async {
    final endResult = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapBoxScreen()));

    //when the marker is tapped, the address is collected and displayed on the screen
    setState(() {
      endMap = endResult;
    });
  }
}

  