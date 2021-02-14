import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ActivityState();
}

class ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SiMotor'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Album>>(
        future: getPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? AlbumList(album: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// model get from jsonPlaceholder
class Album {
  final int id;
  final String title;
  final String thumbnailUrl;

  Album({this.id, this.title, this.thumbnailUrl});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

Future<List<Album>> getPhotos(http.Client clientReq) async {
  final response = await clientReq.get('https://jsonplaceholder.typicode.com/photos?_start=0&_limit=5');

  // Use the compute function to run parsePhotos in a separate isolate.
  // return compute(parsePhotos, response.body);
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Album>.
List<Album> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

class AlbumList extends StatelessWidget {
  final List<Album> album;
  AlbumList({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      itemCount: album.length,
      itemBuilder: (context, index) {
        return Image.network(album[index].thumbnailUrl);
      },
    );
  }

}