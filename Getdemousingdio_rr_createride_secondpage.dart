import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rr_create_ride/Models/create_ride_post_model.dart';
import 'package:flutter_rr_create_ride/widgets/inputfield_with_border.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);



  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

  final Dio dio = Dio();
  final _baseUrl = 'https://api-ecart-vendor.rotam.ai/' ;

  TextEditingController phonenumber=TextEditingController();

 // final SecondRoute  _client = SecondRoute();


  @override
  Widget build(BuildContext context) {
    var screenwidth=MediaQuery.of(context).size.width;
    var screenheight= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Expanded(
            child: Text('Enter Phone number to Get Details')),
      ),
      body: Center(

        child: Column(
          children: [
            TextFieldWithoutBorder(
              hintText: 'Phonenumber',
              textEditingController: phonenumber,
              width: screenwidth/1.049,
              height: screenheight*0.061,
              prefixIcon: Icon(Icons.family_restroom_sharp),
              keyBoardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                //getUser(id: phonenumber.text);
              },
              child: const Text('Enter'),
            ),
             FutureBuilder<CreateRide?>(
              future: getUser(id: phonenumber.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CreateRide? userInfo = snapshot.data;
                  print(userInfo);
                  if (userInfo != null) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          userInfo.customerName,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          userInfo.customerAadhar,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          userInfo.customerPhone,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    );
                  }
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<CreateRide?> getUser({required String id}) async {
    CreateRide? user;
    try {
      Response response = await dio.get(_baseUrl + 'ecart/customer/me/${phonenumber.text}');
      print('User Info: ${response.data}');
      if(response.statusCode==200)
        {
          user = CreateRide.fromJson(response.data);
        }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
}
