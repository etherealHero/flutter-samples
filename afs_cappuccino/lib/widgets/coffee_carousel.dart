import 'package:afs_cappuccino/color_palette.dart';
import 'package:afs_cappuccino/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeCarousel extends StatelessWidget {
  const CoffeeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.0,
      child: ListView.builder(
        itemCount: coffees.length,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.fromLTRB(
            i == 0 ? 15.0 : 0.0,
            15.0,
            15.0,
            15.0,
          ),
          child: CoffeeCard(coffee: coffees[i]),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({super.key, required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 270.0,
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: const LinearGradient(
          colors: <Color>[Color(0xff262a33), Color(0xff0c1015)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image(
                  image: AssetImage(coffee.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            RatingLabel(rating: coffee.rating)
          ]),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            coffee.title,
            style: GoogleFonts.sourceSans3(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
            ),
          ),
          Text(
            coffee.description,
            style: GoogleFonts.sourceSans3(
                color: const Color(0xffa0a1a2),
                fontWeight: FontWeight.normal,
                fontSize: 13.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              AmountLabel(price: coffee.price),
              AddToCartButton(id: coffee.id)
            ],
          )
        ],
      ),
    );
  }
}

class RatingLabel extends StatelessWidget {
  const RatingLabel({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        top: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 2.0),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              )),
          child: Center(
            child: Row(
              children: [
                Icon(Icons.star_rounded,
                    size: 14.0, color: ColorPalette().accentColor),
                Text(
                  rating.toString(),
                  style: GoogleFonts.sourceSans3(
                      color: Colors.white, fontSize: 13.0),
                ),
              ],
            ),
          ),
        ));
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        Icons.add_box_rounded,
        color: ColorPalette().accentColor,
        size: 34.0,
      ),
    );
  }
}

class AmountLabel extends StatelessWidget {
  const AmountLabel({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.sourceSans3(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
        children: [
          TextSpan(
            text: "\$ ",
            style: TextStyle(color: ColorPalette().accentColor),
          ),
          TextSpan(text: price.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
