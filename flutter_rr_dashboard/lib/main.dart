import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DashboardKIContainer.dart';
import 'edit_dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.black
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late TabController _controller = TabController(length: 3, vsync: this,);
  late int selectedIndex;


  @override
  Widget build(BuildContext context) {

    var screenwidth =MediaQuery.of(context).size.width/1.621;
    var screenheight =MediaQuery.of(context).size.height;

    print(" width - $screenwidth and height -$screenheight");

    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        onTap: ()
        {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_sharp,color: Colors.white),
      ),
        centerTitle: true,
          title: Text('Profile',style: GoogleFonts.poppins(color: Colors.white,
            fontWeight: FontWeight.w700,fontSize: 20)),
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.settings_outlined,color: Colors.white,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(

            children: <Widget>[
              Align(alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 51,
                              backgroundColor: Colors.grey,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: PopupMenuButton(
                                    color: Colors.transparent,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: Row(
                                          children: [
                                            Icon(color: Colors.red,Icons.camera_alt_outlined),
                                            SizedBox(width: 10,),
                                            Text('Camera',style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 15,fontWeight: FontWeight.w500),)
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Row(
                                          children: [
                                            Icon(color: Colors.blue,Icons.photo_library_sharp),
                                            SizedBox(width: 10,),
                                            Text('Gallery',style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 15,fontWeight: FontWeight.w500))
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 3,
                                        child: Row(
                                          children: [
                                            Icon(color: Colors.green,Icons.delete),
                                            SizedBox(width: 10,),
                                            Text('Delete',style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 15,fontWeight: FontWeight.w500))
                                          ],
                                        ),
                                      )
                                    ],
                                    child: const CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.yellow,
                                        child: Icon(Icons.edit_outlined) // change this children
                                    ),
                                  )
                              )
                          ),
                          Text('Venu',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,fontWeight: FontWeight.w400)),
                          Text('He is very Good Boy',style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,fontWeight: FontWeight.w400))

                        ],
                      ),
                      SizedBox(width: 28,),
                      Text('Rides',style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,fontWeight: FontWeight.w400)),
                      SizedBox(width: 28,),
                      Text('Distance(km)',style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 16 ),
                child: Text("My Bikes",
                    textScaleFactor: 1,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,color: Colors.white,
                      fontSize: 16
                    )),
              ),
              Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(height: 130.0,),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: (){},
                              child: Container(
                                width: 222,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                    ),

                              )
                          )
                        ],
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    top: 37,
                    child: CircleAvatar(
                      radius: 20,

                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                         /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddBike()));*/
                        },
                        iconSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(

                    isScrollable: true,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis
                    ),
                    labelColor: Colors.white,
                    controller: _controller,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                        _controller.animateTo(index);
                      });
                    },indicatorPadding: EdgeInsets.all(3),
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    tabs: [
                      Tab(
                        child: Text(
                          'Post',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                        ),
                        )
                      ),
                    Tab(
                      child: Text(
                        'Club',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                          ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Dashboard',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                          ),
                      ),
                    )
                  ],)
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(children: [
                        SizedBox(width: MediaQuery.of(context).size.width/22.5,),
                          DashboardContainer(
                        headtitle: 'Solo Ride',
                         titleString: 'Distance',
                         valueString: 20.0),
                          SizedBox(width: MediaQuery.of(context).size.width/18.947,),
                          DashboardContainer(
                            headtitle: 'Group Ride',
                            titleString: 'Distance',
                            valueString: 20.0,),
                      ]),
                      SizedBox(height: 22,),
                      Row(children: [
                        SizedBox(width: MediaQuery.of(context).size.width/22.5,),
                        DashboardContainer(
                          headtitle: 'Captain Ride',
                          titleString: 'Distance',
                          valueString: 20.0,),
                        SizedBox(width: MediaQuery.of(context).size.width/18.947,),
                        DashboardContainer(
                          headtitle: 'Avg Km Per Ride',
                          titleString: 'Solo Ride',
                          valueString: 20.0,)
                      ]),
                     ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditdashBoardPAge()));
                    },
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Container(
                        height: 42,
                        width: 42,
                        // defining one dimension works as well, as Flutter knows how to render a circle.
//        width: MediaQuery.of(context).size.width/2,

                        decoration: BoxDecoration(
                          color: Color(0xfff2f2f2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
