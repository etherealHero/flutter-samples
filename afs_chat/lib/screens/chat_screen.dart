import 'package:flutter/material.dart';
import 'package:afs_chat/models/message_model.dart';
import 'package:afs_chat/models/user_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.user});

  final User user;

  Widget _buildMessage(BuildContext context, int index) {
    final Message message = messages[index];
    final bool isMe = !!(message.sender.id == 0);

    Widget msg = Container(
        decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFFFEFEE),
            borderRadius: isMe
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))
                : const BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
        margin: isMe
            ? const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 80.0)
            : const EdgeInsets.only(top: 5.0, bottom: 5.0),
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.time,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              message.text,
              style: const TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w600),
            ),
          ],
        ));

    if (isMe) {
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
            onPressed: () {},
            icon: message.isLiked
                ? Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: Colors.blueGrey,
                  ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var messageComposer = Container(
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.photo,
                color: Theme.of(context).colorScheme.primary,
                size: 25.0,
              )),
          Expanded(
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                  hintText: "Send a message..."),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Theme.of(context).colorScheme.primary,
                size: 25.0,
              ))
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(user.name,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            iconSize: 30.0,
          )
        ],
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      child: ListView.builder(
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: _buildMessage,
                      ),
                    )),
              ),
              messageComposer
            ],
          ),
        ),
      ),
    );
  }
}
