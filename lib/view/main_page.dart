import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_conv/provider/home_provider.dart';
import 'package:platform_conv/provider/main_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<HomeProvider>(context).isAndroid) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Android"),
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
            )
          ],
        ),
        bottomNavigationBar: Consumer<MainProvider>(
          builder: (BuildContext context, MainProvider value, Widget? child) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: value.menuIndex,
              onTap: (index) {
                print("index $index");
                value.pageController.animateToPage(index,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.linear);
                value.changeMenuIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Person"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Setting"),
              ],
            );
          },
        ),
        body: PageView(
          controller:
              Provider.of<MainProvider>(context, listen: false).pageController,
          onPageChanged: (value) {
            Provider.of<MainProvider>(context, listen: false)
                .changeMenuIndex(value);
            print("index $value");
          },
          children: [
            Calls(),
            Container(
              color: Colors.blue,
              child: Text("missed Calls"),
            ),
            Container(
              color: Colors.blue,
              child: Text("missed Calls"),
            ),
            Container(
              color: Colors.yellow,
            )
          ],
        ),
      );
    } else {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              // return Text("inded $index");
              return SafeArea(
                child: Column(
                  children: [
                    Text("Ios"),
                    // Switch.adaptive(
                    //   value: true,
                    //   onChanged: (value) {},
                    // ),
                    CupertinoSlider(
                      value: 0.3,
                      min: 0,
                      max: 500,
                      onChanged: (value) {
                        print("CupertinoSlider $value");
                      },
                    ),
                    // Slider.adaptive(
                    //   value: 0.3,
                    //   onChanged: (value) {},
                    // ),
                    Consumer<MainProvider>(
                      builder: (context, mainProvider, child) {
                        return CupertinoSegmentedControl<int>(
                          groupValue: mainProvider.itemSelect,
                          children: {
                            1: Text("Call"),
                            2: Text("missed"),
                          },
                          onValueChanged: (value) {
                            mainProvider.changeItem1(value);
                            print("object $value");
                          },
                        );
                      },
                    ),

                    Consumer<MainProvider>(
                      builder: (context, mainProvider, child) {
                        return CupertinoSlidingSegmentedControl<String>(
                          groupValue: mainProvider.item2Select,
                          children: {
                            "call": Text("CAlls"),
                            "ms": Text("Misssed Call"),
                          },
                          onValueChanged: (value) {
                            mainProvider.changeItem2(value ?? "call");
                            print("CupertinoSlidingSegmentedControl $value");
                          },
                        );
                      },
                    ),

                    Consumer<HomeProvider>(
                      builder: (context, homeProvider, child) {
                        return CupertinoSwitch(
                          value: homeProvider.isAndroid,
                          activeColor: Colors.red,
                          trackColor: Colors.black,
                          onChanged: (value) {
                            homeProvider.change();
                          },
                        );
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      );
    }
  }
}

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Abc"),
          subtitle: Text("+91 4579846134"),
        );
      },
    );
  }
}
