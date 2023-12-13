import 'package:flutter/material.dart';
import 'package:news_app/controller/news_tile_controller.dart';
import 'package:news_app/view/home_screen/widget/news_card.dart';
import 'package:news_app/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> fetchDataF() async {
    // await newsTileController.fetchData();
    await Provider.of<NewsTileController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    fetchDataF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsTileController = Provider.of<NewsTileController>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              }),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: newsTileController.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: newsTileController.newsModel.articles?.length,
                itemBuilder: (context, index) => newsColumn(
                  title: Provider.of<NewsTileController>(context)
                          .newsModel
                          .articles?[index]
                          .title ??
                      "",
                  des: Provider.of<NewsTileController>(context)
                          .newsModel
                          .articles?[index]
                          .description ??
                      "",
                  author: Provider.of<NewsTileController>(context)
                          .newsModel
                          .articles?[index]
                          .author ??
                      "",
                  date: Provider.of<NewsTileController>(context)
                          .newsModel
                          .articles?[index]
                          .publishedAt ??
                      "",
                  image: Provider.of<NewsTileController>(context)
                          .newsModel
                          .articles?[index]
                          .urlToImage ??
                      "",
                ),
              ),
      ),
    );
  }
}
