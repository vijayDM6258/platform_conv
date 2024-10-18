import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_conv/provider/home_provider.dart';
import 'package:platform_conv/util/routes_name.dart';
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
        // appBar: AppBar(
        //   actions: [
        //     Consumer<HomeProvider>(
        //       builder: (context, homeProvider, child) {
        //         return Switch(
        //           value: homeProvider.isAndroid,
        //           onChanged: (value) {
        //             homeProvider.change();
        //           },
        //         );
        //       },
        //     ),
        //   ],
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("Hello"),
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 250,
                collapseMode: CollapseMode.parallax,
                background: Image.network(
                    "https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png"),
              ),
            ),
            SliverGrid.builder(
              // gridDelegate:
              //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                int r = Random().nextInt(255);
                int g = Random().nextInt(255);
                int b = Random().nextInt(255);
                return Container(
                  color: Color.fromARGB(255, r, g, b),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        ).then((value) {
                          print("date==> $value");
                        });
                      },
                      child: Text("Select Date")),
                  ElevatedButton(
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          print("date==> $value");
                        });
                      },
                      child: Text("Select Time")),
                  CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                        child: Text("Item 1"),
                        isDefaultAction: true,
                      ),
                      CupertinoContextMenuAction(child: Text("Item 2")),
                      CupertinoContextMenuAction(
                        child: Text("cancel"),
                        isDestructiveAction: true,
                      ),
                    ],
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Image.network(
                          "https://www.daily.co/blog/content/images/2023/07/Flutter-feature.png"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              title: Text("Title"),
                              message: Text("Details"),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {},
                                  child: Text("Item 1"),
                                  isDefaultAction: true,
                                ),
                                CupertinoActionSheetAction(
                                    onPressed: () {}, child: Text("Item 2")),
                                CupertinoActionSheetAction(
                                  onPressed: () {},
                                  child: Text("Remove"),
                                  isDestructiveAction: true,
                                )
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {}, child: Text("Remove")),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.add)),
                  MyButton(),
                  SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (value) {
                        print("object $value");
                      },
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text("item 1"),
                  Text("item 1"),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Text("data $index");
              }, childCount: 15),
            ),
            SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                ],
              ),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            ),
            SliverAppBar(
              title: Text("Hello"),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                  Text("item 1"),
                ],
              ),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.mainPage);
          },
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

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.red.shade50,
                    child: Column(
                      children: [
                        Text("Title"),
                        Text("Detail"),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text("ShowBottomSheet")),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                isDismissible: false,
                enableDrag: false,
                barrierColor: Colors.red,
                builder: (context) {
                  return SafeArea(
                    child: Container(
                      height: 600,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Title",
                              style: TextStyle(fontSize: 32),
                            ),
                            Text(
                              "Detail" * 10,
                              style: TextStyle(fontSize: 32),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Text("ShowModalBottomSheet")),
      ],
    );
  }
}
