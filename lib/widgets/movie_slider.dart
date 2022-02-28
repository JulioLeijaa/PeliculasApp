// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);


  @override 
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ),

          SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _, int index) => _MoviePoster()
            ),
          )
          
        ],
      )
    );
  }
  
}


class _MoviePoster extends StatelessWidget {
  const _MoviePoster({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover
              ),
            )
          ),
          

          SizedBox(height:5),

          Text(
            'Harry Potter y las reliquias de la muerte',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center
          )
        ],
      ) 
    );
  }
}
