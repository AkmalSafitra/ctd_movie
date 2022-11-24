import 'package:auto_route/auto_route.dart';
import 'package:ctd_movie/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../routers/app_routers.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    movieMobx.initial();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              context.pushRoute(NewMovieRoute());
            },
            child: const Text(
              'New',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // physics: const ScrollPhysics(),
        child: Column(
          children: [
            // const Text('Movie List'),
            Observer(
                builder: (context) => Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: movieMobx.movies.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => context.pushRoute(UpdateMovieRoute(id: movieMobx.movies[index].id)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieMobx.movies[index].title
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Directed by ',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          movieMobx.movies[index].director
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    const Text(
                                      'Genre:',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: MediaQuery.of(context).size.width - 40,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                              itemCount: movieMobx
                                                  .movies[index].genres.length,
                                              itemBuilder: (context, indexGenre) {
                                                return Row(
                                                  children: [
                                                    Text(
                                                      movieMobx.movies[index]
                                                          .genres[indexGenre].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(width: 8),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    const Text(
                                      'Summary:',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      movieMobx.movies[index].summary
                                          .toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 14),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey[200],
                              ),
                            ],
                          ),
                        );
                      }),
                )),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
