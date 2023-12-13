import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class newsColumn extends StatelessWidget {
  newsColumn({
    super.key,
    required this.title,
    required this.des,
    required this.image,
    required this.author,
    required this.date,
  });

  String title;
  String des;
  String image;
  String author;
  dynamic date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(
          //       image,
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.share),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            des,
            maxLines: 5,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(author),
            Text(date.toString()),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
