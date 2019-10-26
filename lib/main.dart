import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_travel_concept/controller/home_controller.dart';
import 'package:flutter_travel_concept/screens/main_screen.dart';
import 'package:flutter_travel_concept/util/const.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (_) => HomeController(),
        child: Consumer<HomeController>(
          builder: (_, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Constants.appName,
              theme: value.modeChange ? Constants.darkTheme : Constants.lightTheme,
              home: MainScreen(),
            );
          },
        ));
  }
}
