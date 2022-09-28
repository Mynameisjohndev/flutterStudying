import 'package:bitcoin_price/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Api;
import 'dart:convert';

class FutureHome extends StatefulWidget {
  const FutureHome({super.key});

  @override
  State<FutureHome> createState() => _FutureHomeState();
}

class _FutureHomeState extends State<FutureHome> {
  
  String _urlBase = "https://jsonplaceholder.typicode.com";
 
  Future<List<Post>> _requestPosts() async{
    Api.Response response = await Api.get( Uri.parse(_urlBase + "/posts") );
    var responseDecoded = json.decode( response.body );
    List<Post> posts = [];

    for (var post in responseDecoded){
      Post newPost = Post(
        post["userId"], 
        post["id"], 
        post["title"], 
        post["body"]
      );
      posts.add(newPost);
    }

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _requestPosts(),
        builder: (context, snapshot){
        var result;
        switch(snapshot.connectionState){
            case ConnectionState.waiting: 
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if(snapshot.hasError){
                result = "Erro ao carregar os dados";
              }else{
                print("Carregou");
                result = ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  List<Post>? lista = snapshot.data;
                  Post post = lista![index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.id.toString()),
                  );
                });
              }
              break;
          }
          return result;
        },
      ),
    );
  }
}