import 'package:flutter/material.dart';
import 'package:news_api/models/artical_model.dart';

Widget customListTile(Artical artical) {
  return Container(
    margin: EdgeInsets.all(12.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3.0)]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(artical.urlToImage.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0)),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15.0)),
          child: Text(artical.source!.name.toString()),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          artical.title.toString(),
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
        )
      ],
    ),
  );
}
