import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class User{
  final String name;
  //final int age;
  final String email;

  User({
    required this.name,
  required this.email,
    //required this.age
  });

  User copyWith({
    String? name,
    //int? age,
    String? email,
}){
    return User(
      name: name?? this.name,
      //age: age ?? this.age
      email: email?? this.email,
    );
  }
  Map<String, dynamic> toMap() => {
    "name": name,
    //"age": age,
    "email": email
  };
  factory User.fromMap(Map<String, dynamic> map) => User(
    name: map["name"],
    //age: map["age"],
    email: map["email"]
  );

  String toJson()=> json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name , email:$email)';

  @override
  bool operator == (Object other){
    if(identical(this, other)) return true;

    return other is User &&
    other.name == name&&
    //other.age == age;
        other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;

}



class UserNotifier extends StateNotifier<User>{
  UserNotifier(super.state);

  /*void updateName(String n){
    state = state.copyWith(name: n);
  }
  void updateAge(int a){
    state = state.copyWith(age: a);
  }
}

class UserNotifierChange extends ChangeNotifier{
  User user = User(name: '',age: 0);

  void updateName(String n){
    user = user.copyWith(name: n);
    notifyListeners();
  }
  void updateAge(int a){
    user = user.copyWith(age: a);
    notifyListeners();
  }*/
}
final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository{
  Future<User> fetchUserData(int input){

    var url='https://jsonplaceholder.typicode.com/users/$input';

    return http.get(Uri.parse(url)).then((value) =>  User.fromJson(value.body));
  }
}