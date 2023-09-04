import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_again/controller/LanguageController.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  String? languagecode = sp.getString('language_code') ?? "" ;
  runApp(MyApp(locale: languagecode,));
}

class MyApp extends StatelessWidget {
    MyApp({super.key,this.locale = ''});
   String locale ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => LanguagechangeController() )
        
        
      ] ,
    /// here is the templete type is most importent to call the method and get out
    child: Consumer<LanguagechangeController>(builder: (BuildContext context, provider, Widget? child) {
      if(locale.isEmpty){
        provider.ChangeLanguage(Locale('en'));
      }
      return MaterialApp(
        locale: locale == '' ?Locale('en') :provider.applocle == null ? Locale('en'): provider.applocle,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en'),
          Locale('ur'),
        ],

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    },)
    );

  }
}
