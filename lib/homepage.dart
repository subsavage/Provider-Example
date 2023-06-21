import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider.dart';

import 'fav_movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var favList = context.watch<MovieProvider>().favList;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Provider",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (_, index) {
                      final currMovie = movies[index];

                      return Card(
                        key: ValueKey(currMovie.title),
                        color: Colors.blue,
                        elevation: 4,
                        child: ListTile(
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: favList.contains(currMovie)
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onPressed: () {
                              if (!favList.contains(currMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addToList(currMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromList(currMovie);
                              }
                            },
                          ),
                          title: Text(
                            currMovie.title ?? '',
                          ),
                          subtitle: Text(currMovie.duration ?? 'No info'),
                        ),
                      );
                    }),
              ),
              FloatingActionButton(
                elevation: 4,
                child: Icon(Icons.favorite),
                shape: const CircleBorder(eccentricity: 1.0),
                onPressed: (() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const FavList()));
                }),
              )
            ],
          ),
        ));
  }
}
