part of twitter;

class Home extends StatefulWidget {
  final String title;
  final dynamic user;
  Home({Key key, this.title, this.user}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}
