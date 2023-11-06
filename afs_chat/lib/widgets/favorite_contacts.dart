import 'package:afs_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:afs_chat/models/message_model.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Favorite Contacts',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.blueGrey,
                      size: 30.0,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 120,
            // color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(user: favorites[index]))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 12.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage(favorites[index].imageUrl),
                          radius: 30.0,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          favorites[index].name,
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
