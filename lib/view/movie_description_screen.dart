import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDescriptionSreen extends StatelessWidget {
   MovieDescriptionSreen({Key? key, required this.description}) : super(key: key);
   String description;

  @override
  Widget build(BuildContext context) {
    print(description);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie Desciption"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(description),
        ),
      ),
    );
  }
}
