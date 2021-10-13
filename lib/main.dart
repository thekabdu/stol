import 'package:click/components/slider_home.dart';
import 'package:click/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const showCard = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melt',
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        endDrawer: NavigationDrawerWidget(),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              width: (242),
              height: (100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.cover,
                    ),
                    SliderHome()
                  ],
                ),
              ),
            ),
          ],
        )),
      );
}
