import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapporders/provider/cart.dart';
import 'package:groceryapporders/provider/product.dart';
import 'package:groceryapporders/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(
          value: Product(),
        ),

        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery App',
        theme: ThemeData(
primaryColor: Colors.amber,
          brightness: Brightness.light,
          primarySwatch: Colors.amber,
        ),
        home: SplashScreen(),
//        StreamBuilder(
//          stream: FirebaseAuth.instance.onAuthStateChanged,
//          builder: (ctx, AsyncSnapshot userSnapshot){
//            if(userSnapshot.hasData){
//              return StoresListPage();
//            }
//            return SignInPage();
//          },
//        ),

      ),
    );
  }
}
