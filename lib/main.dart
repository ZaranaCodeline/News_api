import 'package:flutter/material.dart';
import 'package:news_api/components/custom_listtile.dart';
import 'package:news_api/models/artical_model.dart';
import 'package:news_api/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    print('>>>>${client.getArtical()}');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Artical>>(
        future: client.getArtical(),
        builder: (BuildContext context, AsyncSnapshot<List<Artical>> snapShot) {
          if (snapShot.hasData) {
            print('>>>>1');
            List<Artical>? articles = snapShot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) {
                return customListTile(articles![index]);
              },
            );
          }
          print('>>>>2');

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
