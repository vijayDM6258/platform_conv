import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_conv/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var isAndroid = Provider.of<HomeProvider>(context, listen: false).isAndroid;
    if (isAndroid) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return Switch(
                  value: homeProvider.isAndroid,
                  onChanged: (value) {
                    homeProvider.change();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            CupertinoButton.filled(
              child: Text("Ok"),
              onPressed: () {},
            ),
            CupertinoActivityIndicator(
              color: Color(0xff72a4d6),
            ),
            CircularProgressIndicator(
              value: 0.6,
              // color: Color(0xff72a4d6),
              // color: Color.fromARGB(200, 114, 164, 214),
              // color: Color.fromRGBO(114, 164, 214, 0.5),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      );
    } else {
      return CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              Text("Hello every one"),
              CupertinoButton(
                child: Text("Click"),
                onPressed: () {
                  print("Click");
                  print("Android => ${Platform.isAndroid}");
                  print("IOS => ${Platform.isIOS}");
                  print("Linux => ${Platform.isLinux}");
                  print("MacOS => ${Platform.isMacOS}");
                  print("Windows => ${Platform.isWindows}");
                  print("web => ${kIsWeb}");
                },
              )
            ],
          ),
        ),
      );
    }
  }
}
