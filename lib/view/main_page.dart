import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_conv/provider/home_provider.dart';
import 'package:platform_conv/provider/main_provider.dart';
import 'package:platform_conv/view/cupertino_call_com.dart';
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
              child: Text(
                "Setting Page",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
    } else {
      return CupertinoTabScaffold(
        backgroundColor: Colors.blue.shade100,
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
              if (index == 1) {
                return CupertinoCall();
              } else {
                return SafeArea(
                    child: CustomScrollView(
                  slivers: [
                    CupertinoSliverNavigationBar(
                      largeTitle: Text("Welcome"),
                      middle: Text("Hello"),
                      alwaysShowMiddle: false,
                    ),
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          CupertinoListSection(
                            dividerMargin: 20,
                            header: Text("Setting"),
                            footer: Text("v 1.0.0 - 1"),
                            separatorColor: Colors.red,
                            hasLeading: false,
                            children: [
                              CupertinoListTile(
                                title: Text("Language"),
                                additionalInfo: Text("Wifi"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              CupertinoListTile(title: Text("General")),
                              CupertinoListTile(title: Text("Time")),
                            ],
                          ),
                          CupertinoButton(
                            child: Text("Click"),
                            onPressed: () {},
                          ),
                          CupertinoButton.filled(
                            child: Text("Click 1"),
                            onPressed: () {},
                          ),
                          CupertinoListSection.insetGrouped(
                            backgroundColor: Colors.redAccent,
                            children: [
                              CupertinoListTile(
                                title: Text("Language"),
                                additionalInfo: Text("Wifi"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              CupertinoListTile(title: Text("General")),
                              CupertinoListTile(title: Text("Time")),
                            ],
                          ),
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CupertinoListTile(
                                title: Text("Abc"),
                                subtitle: Text("+91 4579846134"),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ));
              }
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
