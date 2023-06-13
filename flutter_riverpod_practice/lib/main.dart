import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/user.dart';
import 'package:flutter_riverpod_practice/userFutureprovider.dart';
import 'package:http/http.dart' as http;



//final nameProvider= Provider((ref)=> 'VENU raks');
//final nameProvider= StateProvider<String?>((ref) => null);
//final userProvider= StateNotifierProvider<UserNotifier,User>((ref) => UserNotifier( User(name: 'r', age: 0)));
//final userChangeNotifierProvider=ChangeNotifierProvider((ref)=>UserNotifierChange());

final fetchUserProvider = FutureProvider((ref){
 // return UserRepository().fetchUserData();
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

final streamProvider = StreamProvider((ref) async*{
  yield[1,2,3,4,5,6,7,8,9,10];
});

void main() {
  runApp(const ProviderScope (child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  void onSubmit(WidgetRef ref,String value)
  {
    //ref.read(nameProvider.notifier).update((state) => value);
    //ref.read(userProvider.notifier).updateName(value);
    //ref.read(userChangeNotifierProvider).updateName(value);
  }

  void onSubmitage(WidgetRef ref,String value)
  {
    //ref.read(nameProvider.notifier).update((state) => value);
    //ref.read(userProvider.notifier).updateAge(int.parse(value));
    //ref.read(userChangeNotifierProvider).updateAge(int.parse(value));
  }
  @override
 Widget build(BuildContext context,WidgetRef ref ){
    //final name= ref.watch(nameProvider) ?? '';
   // final user=ref.watch(userProvider);
   // final user = ref.watch(userProvider.select((value) => value.name));
    //final user=ref.watch(userChangeNotifierProvider).user;
    
    /*final user = ref.watch(fetchUserProvider);

    return user.when(data: (data){
      print(data.name);
      print(data.email);
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Text(data.name),
            )
          ],
        ),
      );
    },
        error: (error,stackTrace){
      return Center(child: Text(error.toString()));
        },
        loading: (){
          return Center(child: CircularProgressIndicator());
        });*/
   /* return Scaffold(
      appBar: AppBar(
        //title: Text(user.name),
      ),
      body: Column(
        children: [
          Center(
            child: Text(''),
          )*/
          /*TextField(
          onSubmitted: (value)=> onSubmit(ref,value),
        ),
          TextField(
            onSubmitted: (value)=> onSubmitage(ref,value),
          ),
          Center(
            child: Text(user.age.toString()),
          )*/
        /*],
      )
    );*/

  }
}

class MyHomepage extends ConsumerStatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends ConsumerState<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(),
        body: ref.watch(streamProvider).when(data: (data){
          return Center(child: Text(data.toString()));
        },
            error: (error,stacktrace){
              return Center(
                  child: Text(
                      error.toString()
                  )
              );
            },
            loading: (){
              return Center(child: CircularProgressIndicator());
            }));
  }
}
