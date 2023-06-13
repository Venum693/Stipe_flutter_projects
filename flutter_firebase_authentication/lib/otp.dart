import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/phone.dart';
import 'package:pinput/pinput.dart';

class MyOTP extends StatefulWidget {
  const MyOTP({Key? key}) : super(key: key);

  @override
  State<MyOTP> createState() => _MyOTPState();
}

class _MyOTPState extends State<MyOTP> {

  final FirebaseAuth auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code='';
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed:() {
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back_outlined
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Now',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

              SizedBox(height: 10),
              const Text('Enter OTP',
                style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height: 10),

              Pinput(
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onChanged: (value){
                  code=value;
                },
              ),

              SizedBox(
                child: ElevatedButton(onPressed: () async{
                 try
                     {
                       PhoneAuthCredential credential =
                       PhoneAuthProvider.credential(verificationId: MyPhone.verify,
                           smsCode: code);

                       // Sign the user in (or link) with the credential
                       await auth.signInWithCredential(credential);
                       Navigator.pushNamedAndRemoveUntil(
                           context, "home", (route) => false);

                     }catch(e)
                  {
                    print('Wrong OTP');
                  }
                },
                  child: Text('Verify the code'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),),
              ),

              Row(
                children: [
                  TextButton(onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'phone', (route) => false);
                  },
                      child: Text('Edit Phone Number ?',
                        style: TextStyle(fontSize: 20,color: Colors.black),)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
