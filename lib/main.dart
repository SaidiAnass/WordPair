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
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        // ignore: prefer_const_constructors
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randowWordPairs.length) {
          _randowWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randowWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("WordPair Generator")), body: _buildList());
  }
}
