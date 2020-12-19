import 'package:ecommerce_api/components/applocal.dart';
import 'package:ecommerce_api/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:   Home(),
      localizationsDelegates: [
        AppLocale.delegate , 
        GlobalMaterialLocalizations.delegate , 
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales:[
        Locale("en"  , "") , 
        Locale("ar"  , "") , 
      ] ,
      locale: Locale("ar" , ""),
      localeResolutionCallback:( currentLang , supportLang ){
         if (currentLang != null) {
             for (Locale locale in supportLang) {
                if (locale.languageCode == currentLang.languageCode) {
                  return currentLang ; 
                }    
             }
         }
         return supportLang.first ; 
      } ,
    );
  }
}
