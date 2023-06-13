

import 'dart:convert';

import 'package:dio/dio.dart';

import '../Models/create_ride_post_model.dart';
import '../Models/get_rides_model.dart';

abstract class RideCaptainRepository {
  Future<CreateRideModel?> createRide({required trip});
}

const baseUrl = "https://dev-api.realroadies.com/";

class RidesApi implements RideCaptainRepository{
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
  @override
  Future<CreateRideModel?> createRide({required trip}) async {

    //CreateRide? retrievedUser;
    try {
      Response response = await _dio.post(
        // _baseUrl+'ecart/customer/register',
        'https://api-ecart-vendor.rotam.ai/ecart/customer/register',
          data: jsonEncode(CreateRideModel.toJson(trip)),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          )
      );

      print('User created: ${response.data}');

      //retrievedUser = CreateRide.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }
    // return retrievedUser;
  }
  @override
  Future<RidesList> getAllRides() async {
    //_dio.addSentry();
    //final transaction = Sentry.startTransaction('rideCaptain', 'GET',description: 'api/v1/ridecaptain/', bindToScope: true);

    try {
      Response response = await _dio.get(
        //'https://api.realroadies.com/'
          'api/v1/ridecaptain/',
          options: Options(headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            //'Authorization': $token,
          }));

      if (response.statusCode == 200) {
        //transaction.status = SpanStatus.fromHttpStatusCode(response.statusCode ?? -1);
        print('Response : ${response.data}');
        print('Response Code: ${response.statusCode}');
        print('Response Headers: ${response.headers}');
        print('Response REALURI is ${response.realUri.path}');

        return RidesList.fromJson(response.data);
      } else {
        throw response.statusCode ?? 500;
      }
    } on DioError catch (e) {
      //transaction.throwable = e;
      //transaction.status = const SpanStatus.internalError();

      if (e.type == DioErrorType.connectionTimeout) {
        throw Exception('Please Check Your internet Connection');
      } else {
        throw Exception(e.response?.data);
      }
    } finally {
      //await transaction.finish();
      //await Sentry.close();
    }
  }
}