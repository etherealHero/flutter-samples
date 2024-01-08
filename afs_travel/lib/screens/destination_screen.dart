import 'package:afs_travel/models/activity_model.dart';
import 'package:afs_travel/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({super.key, required this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    var stars = '';

    for (var i = 0; i < rating; i++) {
      stars += '⭐️ ';
    }

    stars = stars.trim();

    return Text(
      stars,
      style: const TextStyle(fontSize: 10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0.0),
                      bottom: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0),
                    ]),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(0.0),
                      bottom: Radius.circular(30.0),
                    ),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      iconSize: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.search),
                          color: Colors.black,
                          iconSize: 30.0,
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(FontAwesomeIcons.arrowDownWideShort),
                          color: Colors.black,
                          iconSize: 25.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white70,
                          size: 18.0,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          widget.destination.country,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 26.0,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];

                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      padding:
                          const EdgeInsets.fromLTRB(70.0, 10.0, 10.0, 10.0),
                      height: 160.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 130.0,
                                child: Text(
                                  activity.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '\$${activity.price}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                  const Text(
                                    'per pax',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(activity.type,
                              style: const TextStyle(color: Colors.grey)),
                          _buildRatingStars(activity.rating),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Text(activity.startTimes[0]),
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Text(activity.startTimes[1]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        left: 20.0,
                        top: 17.0,
                        bottom: 17.0,
                        child: SizedBox(
                          width: 80.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage(activity.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
