import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyPhone extends StatefulWidget {
  const MyPhone ({Key? key}) : super(key: key);
  static String verify='';

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {

  TextEditingController countrycode = TextEditingController();
  var phone='';

  @override
  void initState() {
    countrycode.text="+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Now',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

              SizedBox(height: 10),
              const Text('Enter your Phone number',
                style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1,color: Colors.yellow)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),

                    SizedBox(
                      width: 40,
                      child: TextField(
                          controller: countrycode,
                          decoration: InputDecoration(
                              border: InputBorder.none
                          )),
                    ),

                    Text("|",style: TextStyle(fontSize: 33,
                        color: Colors.grey),),
                    Expanded(
                        child: TextField(
                          onChanged: (value){
                            phone=value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: 'Phone',
                              border: InputBorder.none
                          ),
                        )
                    )
                  ],
                ),
              ),

              SizedBox(
                child: ElevatedButton(onPressed: () async{


                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text + phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        MyPhone.verify= verificationId;
                        Navigator.pushNamed(context, 'otp');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );

                },
                  child: Text('send the code'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
