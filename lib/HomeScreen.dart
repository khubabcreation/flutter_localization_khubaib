import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_again/controller/LanguageController.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
enum Language {english,urdu}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Consumer<LanguagechangeController>(builder: (context,provider,child){
            return  PopupMenuButton(
                onSelected: (Language item){
                  if(Language.english.name == item.name){
                    provider.ChangeLanguage(Locale('en'));
                  }else {
                    provider.ChangeLanguage(Locale('ur'));
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
                  PopupMenuItem(
                      value: Language.english,
                      child: Text('English')),
                  PopupMenuItem(
                      value: Language.urdu,
                      child: Text('Urdu')),
                ]);
          }),
        ],
      ),
      body: SafeArea(child: Column(children: [
        Text(AppLocalizations.of(context)!.driving),

      ],),),
    );
  }
}
