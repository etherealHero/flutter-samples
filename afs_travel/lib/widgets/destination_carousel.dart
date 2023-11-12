import 'package:afs_travel/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({
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
              const Text('Top Destinations',
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
          height: 310.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                Destination destination = destinations[index];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  width: 200.0,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Positioned(
                      bottom: 10.0,
                      child: Container(
                        width: 180.0,
                        height: 120.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${destination.activities.length} activities",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                            Text(
                              destination.description,
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
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
                        child: Stack(children: [
                          Image(
                            height: 160.0,
                            width: 160.0,
                            image: AssetImage(destination.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 10.0,
                            left: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  destination.city,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 1.5),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const Icon(
                                      FontAwesomeIcons.locationArrow,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                    const SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      destination.country,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
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
