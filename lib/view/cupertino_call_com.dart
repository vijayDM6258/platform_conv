import 'package:flutter/cupertino.dart';
import 'package:platform_conv/provider/main_provider.dart';
import 'package:provider/provider.dart';

class CupertinoCall extends StatefulWidget {
  const CupertinoCall({super.key});

  @override
  State<CupertinoCall> createState() => _CupertinoCallState();
}

class _CupertinoCallState extends State<CupertinoCall> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text("Call"),
        ),
        SliverToBoxAdapter(
          child: Consumer<MainProvider>(
            builder: (context, mainProvider, child) {
              return CupertinoSlider(
                value: mainProvider.slideVal,
                min: 0,
                max: 100,
                onChanged: (value) {
                  mainProvider.changeSlideVal(value);
                  print("object $value");
                },
              );
            },
          ),
        ),
        SliverFillRemaining(
          child: Consumer<MainProvider>(
            builder: (context, mainProvider, child) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: mainProvider.slideVal.toInt(),
                reverse: true,
                itemBuilder: (context, index) {
                  return CupertinoListTile(title: Text("User $index"));
                },
              );
            },
          ),
        )
      ],
    );
  }
}
