import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String releaseDate;
  final VoidCallback onPress;
  const MovieListItemCard({Key? key, required this.image, required this.title, required this.releaseDate, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: ListTile(
          leading: Image.network(image, width: 100, height: 100,
            errorBuilder: (context, error, stack){
              return Icon(Icons.error, color: Colors.red,);
            },
            fit: BoxFit.cover,
          ),
          title:  Text(title),
          subtitle: Text(releaseDate),
        ),

      ),
    );
  }
}
