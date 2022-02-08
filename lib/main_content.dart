import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class  RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();

}
class RandomWordsState extends State<RandomWords>
{
  final _randomWordPairs = <WordPair>[];
  final _favWordPairs = Set<WordPair>();

  Widget _buildList(){
    return
      ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (context, item)
          {
            if(item.isOdd) return Divider();

            final index = item / 1;

            if(index >= _randomWordPairs.length)
            {
              _randomWordPairs.addAll(generateWordPairs().take(20));
            }

            return _buildRow(_randomWordPairs[index.toInt()]);

          }
      );
  }

  Widget _buildRow(WordPair wordPair)
  {
    final alreadySaved = _favWordPairs.contains(wordPair);

    return ListTile(
      title: Text(wordPair.asPascalCase, style:
      TextStyle(fontSize: 15),),
      trailing: IconButton(icon: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border , color: alreadySaved ? Colors.red : null),onPressed: (){
        setState(() {
          if(alreadySaved)
          {
            _favWordPairs.remove(wordPair);
          }
          else
          {
            _favWordPairs.add(wordPair);
          }
        });
      },),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'), centerTitle: true,
      ),
      body: _buildList(),
    );
  }

}