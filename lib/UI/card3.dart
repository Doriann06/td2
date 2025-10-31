import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/todo.dart';
import 'detailTodo.dart';
import '../api/api.dart';
void main() {
  runApp(Ecran3());
}

class Ecran3 extends StatelessWidget {
 final API api = API();

  Ecran3({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: API.getTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done &&
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, index) {
              return Card(
                color: Colors.white,
                elevation: 7,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.yellowAccent,
                    child: Text(snapshot.data?[index].id.toString() ?? ""),
                  ),
                  title: Text(snapshot.data?[index].title ?? ""),
                  subtitle: Text(snapshot.data?[index].tags.join(" ") ?? ""),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Detail(todo: snapshot.data![index]),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}