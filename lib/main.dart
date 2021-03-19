import 'package:ecommerce_api/components/applocal.dart';
import 'package:ecommerce_api/pages/sliderintro/sliderIntro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences mySharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mySharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeLang(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(headline4: TextStyle(color: Colors.orange[900])),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SliderIntro(),
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale("en", ""),
          Locale("ar", ""),
        ],
 
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.languageCode == currentLang.languageCode) {
                mySharedPreferences.setString("lang",currentLang.languageCode) ; 
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
      ),
    );
  }
}

class ChangeLang with ChangeNotifier {}
