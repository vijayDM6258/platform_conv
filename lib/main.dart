import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_conv/provider/detail_provider.dart';
import 'package:platform_conv/provider/home_provider.dart';
import 'package:platform_conv/provider/main_provider.dart';
import 'package:platform_conv/util/routes_name.dart';
import 'package:platform_conv/view/detail_page.dart';
import 'package:platform_conv/view/home_page.dart';
import 'package:platform_conv/view/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(
          create: (context) => DetailProvider(),
        )
      ],
      builder: (context, child) {
        // return CupertinoApp();
        var isAndroid = Provider.of<HomeProvider>(context).isAndroid;
        return isAndroid
            ? MaterialApp(
                initialRoute: RoutesName.homePage,
                routes: {
                  RoutesName.homePage: (context) => HomePage(),
                  RoutesName.detailPage: (context) => DetailPage(),
                  RoutesName.mainPage: (context) => MainPage(),
                },
              )
            : CupertinoApp(
                initialRoute: RoutesName.homePage,
                routes: {
                  RoutesName.homePage: (context) => HomePage(),
                  RoutesName.detailPage: (context) => DetailPage(),
                  RoutesName.mainPage: (context) => MainPage(),
                },
              );
      },
    );
  }
}
