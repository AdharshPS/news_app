import 'package:flutter/material.dart';
import 'package:news_app/controller/news_tile_controller.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/view/home_screen/widget/news_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<void> showData() async {
    await Provider.of<NewsTileController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    showData();
    super.initState();
  }

  final searchResult = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchCon = Provider.of<SearchScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: searchResult,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Search",
              suffixIcon: IconButton(
                onPressed: () async {
                  await Provider.of<SearchScreenController>(context,
                          listen: false)
                      .searchData(searchData: searchResult.text.toLowerCase());
                  // Navigator.pop(context);
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Provider.of<SearchScreenController>(context).isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:
                    SearchScreenController().newsSearchModel.articles?.length ??
                        0,
                itemBuilder: (context, index) => newsColumn(
                  title: Provider.of<SearchScreenController>(context)
                          .newsSearchModel
                          .articles?[index]
                          .title ??
                      "",
                  des: Provider.of<SearchScreenController>(context)
                          .newsSearchModel
                          .articles?[index]
                          .description ??
                      "",
                  author: Provider.of<SearchScreenController>(context)
                          .newsSearchModel
                          .articles?[index]
                          .author ??
                      "",
                  date: Provider.of<SearchScreenController>(context)
                          .newsSearchModel
                          .articles?[index]
                          .publishedAt ??
                      "",
                  image: Provider.of<SearchScreenController>(context)
                          .newsSearchModel
                          .articles?[index]
                          .urlToImage ??
                      "",
                ),
              ),
      ),
    );
  }
}
