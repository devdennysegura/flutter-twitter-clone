part of twitter;

class NotificationState extends State<Notification> with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController(
    keepScrollOffset: true,
    initialScrollOffset: 0.0,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}
