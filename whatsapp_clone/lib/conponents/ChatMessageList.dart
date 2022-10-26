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
            double containerWidth = MediaQuery.of(context).size.width * 0.7;
            Color mycolor = Color(0xffd2ffa5);
            Alignment myAlignment = Alignment.centerRight;
            Alignment hourMessage = Alignment.centerLeft;
            CrossAxisAlignment crossAxisAlignmentMessage = CrossAxisAlignment.end;
            if (index % 2 == 0) {
              mycolor = Colors.white;
              myAlignment = Alignment.centerLeft;
              hourMessage = Alignment.centerRight;
              crossAxisAlignmentMessage = CrossAxisAlignment.start;
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: crossAxisAlignmentMessage,
                      children: [
                        Text(
                          item,
                          style: TextStyle(fontSize: 18),
                        ),
                        Align(
                          alignment: hourMessage,
                          child: Text(
                            "20:08",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[400]),
                          ),
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
