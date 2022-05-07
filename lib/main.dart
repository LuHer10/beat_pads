import 'package:beat_pads/services/model_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme.dart';

import 'package:beat_pads/services/_services.dart';

import 'package:beat_pads/screen_splash/_screen_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DeviceUtils.hideSystemUi()
      .then((_) => DeviceUtils.enableRotation())
      .then((_) => Prefs.initAsync())
      .then((Prefs initialPreferences) => runApp(App(initialPreferences)));
}

class App extends StatelessWidget {
  const App(this.prefs, {Key? key}) : super(key: key);

  final Prefs prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Settings(prefs)),
        ChangeNotifierProvider(create: (context) => Variables()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: SplashScreen(),
      ),
    );
  }
}
