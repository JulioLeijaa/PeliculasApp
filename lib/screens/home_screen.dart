import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            //CardSwiper
            CardSwiper(),
            //Listado horizontal de películas
            MovieSlider()
          ]
        ),
      ) ,
    );
  }
}
