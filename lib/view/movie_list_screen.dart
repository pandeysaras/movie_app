import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/components/movie_list_item_card.dart';
import 'package:movie_app/utils/routing/routes_name.dart';
import 'package:movie_app/view_model/movie_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../data/response/status.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  MovieListViewModel movieListViewModel = MovieListViewModel();
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    movieListViewModel.fetchMovieListAPi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Search movies',
                  suffixIcon: searchController.text.isEmpty ? const Icon(Icons.search) :
                  GestureDetector(
                      onTap: (){
                        searchController.text = "" ;
                        setState(() {
                        });
                      },
                      child: Icon(Icons.clear)),

                ),
                onChanged: (value){
                  setState(() {

                  });
                },
              ),

            ),
            Expanded(
              child: FutureBuilder(
                  future: movieListViewModel.fetchMovieListAPi(),
                  builder: (context,AsyncSnapshot<List<dynamic>>  snapshot){
                    print(snapshot);
                    if(!snapshot.hasData){
                      return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index){
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading:  Container(height: 50 , width: 50, color: Colors.white,),
                                  title:  Container(
                                    width: 100,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  subtitle:  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ),

                              ],
                            ),
                          );
                        },

                      );
                    }else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            String name = snapshot.data![index]['title'];
                            if(searchController.text.isEmpty){
                              return MovieListItemCard(image: snapshot.data![index]['thumbnail'], title: snapshot.data![index]['title'], releaseDate: snapshot.data![index]['year'].toString(),
                                  onPress: (){
                                Navigator.pushNamed(context, RouteName.movieDescriptionScreen, arguments: snapshot.data![index]['description']);
                                  });

                            }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                              return MovieListItemCard(image: snapshot.data![index]['thumbnail'], title: snapshot.data![index]['title'], releaseDate: snapshot.data![index]['year'].toString(),
                                  onPress: (){
                                    Navigator.pushNamed(context, RouteName.movieDescriptionScreen, arguments: snapshot.data![index]['description']);
                                  });
                            }else {
                              return Container(
                              );
                            }
                          }
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
