import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text("")),
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (BuildContext context, MainProvider value, Widget? child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: value.menuIndex,
            onTap: (index) {
              print("index $index");
              value.pageController.animateToPage(index,
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
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
