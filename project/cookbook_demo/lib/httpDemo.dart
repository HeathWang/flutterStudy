import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Fail to load post.');
  }
}

class FetchDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Demo'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
          future: fetchPost(),
        ),
      ),
    );
  }
}
