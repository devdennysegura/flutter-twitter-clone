part of twitter;

class Notification extends StatefulWidget {
  final String title;
  Notification({Key key, this.title}) : super(key: key);

  @override
  NotificationState createState() => NotificationState();
}