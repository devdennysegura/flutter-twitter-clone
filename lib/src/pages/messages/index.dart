part of twitter;

class Message extends StatefulWidget {
  final String title;
  Message({Key key, this.title}) : super(key: key);

  @override
  MessageState createState() => MessageState();
}
