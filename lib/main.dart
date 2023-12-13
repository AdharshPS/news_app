import 'package:flutter/material.dart';
import 'package:news_app/controller/news_tile_controller.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsTileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
