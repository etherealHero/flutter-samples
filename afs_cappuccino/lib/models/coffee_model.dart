class Coffee {
  Coffee({
    required this.id,
    required this.title,
    required this.rating,
    required this.description,
    required this.image,
    required this.price,
  });

  final int id;
  final String title;
  final double rating;
  final String description;
  final double price;
  final String image;
}

final List<Coffee> coffees = <Coffee>[
  Coffee(
    id: 1,
    title: "Cappuccino",
    rating: 4.5,
    description: "With Oat Milk",
    price: 4.2,
    image: "assets/images/coffeemain.jpg",
  ),
  Coffee(
    id: 2,
    title: "Cappuccino",
    rating: 4.2,
    description: "With Chocolate",
    price: 3.14,
    image: "assets/images/secondary.jpg",
  ),
  Coffee(
    id: 3,
    title: "Cappuccino",
    rating: 4.5,
    description: "With Oat Milk",
    price: 4.2,
    image: "assets/images/coffeemain.jpg",
  ),
  Coffee(
    id: 4,
    title: "Cappuccino",
    rating: 4.2,
    description: "With Chocolate",
    price: 3.14,
    image: "assets/images/secondary.jpg",
  ),
  Coffee(
    id: 3,
    title: "Cappuccino",
    rating: 4.5,
    description: "With Oat Milk",
    price: 4.2,
    image: "assets/images/coffeemain.jpg",
  ),
  Coffee(
    id: 4,
    title: "Cappuccino",
    rating: 4.2,
    description: "With Chocolate",
    price: 3.14,
    image: "assets/images/secondary.jpg",
  )
];
