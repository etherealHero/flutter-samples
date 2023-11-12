import 'package:afs_travel/models/hotel_model.dart';
import 'package:flutter/material.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Exclusive Hotels',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2)),
              GestureDetector(
                onTap: () {},
                child: Text('See All',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 285.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                Hotel hotel = hotels[index];

                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  width: 280.0,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Positioned(
                      bottom: 10.0,
                      child: SizedBox(
                        width: 260.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(hotel.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            Text(
                              hotel.address,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text("\$${hotel.price} / night",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 260.0,
                      height: 160.0,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 10.0)
                      ]),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Image(
                          height: 160.0,
                          width: 160.0,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                );
              }),
        )
      ],
    );
  }
}
