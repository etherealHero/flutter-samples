import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    super.key,
  });

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  var _favoriteCount = 41;
  var _isFavorite = true;

  toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
      } else {
        _favoriteCount += 1;
      }
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            _isFavorite ? Icons.star : Icons.star_border,
            color: Colors.red[500],
          ),
          onPressed: toggleFavorite,
        ),
        Text('$_favoriteCount')
      ],
    );
  }
}
