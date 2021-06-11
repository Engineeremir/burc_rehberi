import 'package:burc_rehberi/constants/constants_init.dart';
import 'package:burc_rehberi/view/burc_detay.dart';
import 'package:burc_rehberi/view/burc_liste.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: customStrings.title ,
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",

      routes: {
        "/" : (context)=> BurcListesi(),
        "/burcListesi" : (context)=> BurcListesi(),


      },
      
      onGenerateRoute: (RouteSettings settings){
        List<String> pathelemenlari = settings.name!.split("/");
        if(pathelemenlari[1]=="burcDetay"){
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathelemenlari[2])));
        }

      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      
    );
  }
}
