import 'package:flutter/material.dart'

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, int index) {
          return FadeInImage(
            placeholder: placeholder,
            image: NetworkImage('')
          );
        }
      )
    )
  }
}