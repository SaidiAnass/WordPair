import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple[900],
          ),
        ),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randowWordPairs = <WordPair>[];

  Widget _buildList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item){
        if(item.isOdd) return Divider();
      }
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("WordPair Generator")
      ),
      body: _buildList()
    )
  }
}
