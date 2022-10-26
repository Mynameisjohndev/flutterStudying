import 'package:flutter/material.dart';

class ChatMessageList extends StatefulWidget {
  const ChatMessageList(this.messages, {super.key});
  final List<String> messages;
  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.messages.length,
          itemBuilder: (context, index) {
            var item = widget.messages[index];
            double containerWidth = MediaQuery.of(context).size.width* 0.7;
            Color mycolor = Color(0xffd2ffa5);
            Alignment myAlignment = Alignment.centerRight;
            if (index % 2 == 0) {
              mycolor = Colors.white;
              myAlignment = Alignment.centerLeft;
            }
            return Align(
              alignment: myAlignment,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  width: containerWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: mycolor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
