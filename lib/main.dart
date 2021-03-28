import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jetex_app/ui/screens/auth/welcome_screen.dart';
import 'package:jetex_app/ui/screens/auth/login_screen.dart';
import 'package:jetex_app/ui/screens/navigation_screen.dart';
import 'package:jetex_app/utils/app_language.dart';
import 'package:jetex_app/utils/app_localization.dart';
import 'package:provider/provider.dart';

import 'ui/screens/auth/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(appLanguage: appLanguage,));
}

class MyApp extends StatelessWidget {

  final AppLanguage appLanguage;
  const MyApp({this.appLanguage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child){
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('tr', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: WelcomeScreen(),
        );
      },),
    );

    /*
    return MaterialApp(
      title: 'Jetex',
      home:
     // NavigationScreen(),
      WelcomeScreen()
    );
    */
  }
}
