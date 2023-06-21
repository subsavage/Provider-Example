import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider.dart';

class FavList extends StatefulWidget {
  const FavList({super.key});

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    final favList = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Favorite Movies",
        ),
      ),
      body: ListView.builder(
          itemCount: favList.length,
          itemBuilder: (_, index) {
            final currMovie = favList[index];
            return Card(
              key: ValueKey(currMovie.title),
              child: ListTile(
                trailing: TextButton(
                  child: const Text("Remove"),
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currMovie);
                  },
                ),
                title: Text(currMovie.title ?? ' '),
              ),
            );
          }),
    );
  }
}
