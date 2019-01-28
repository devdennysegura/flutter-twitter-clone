part of twitter;

class FeedCardAction extends StatelessWidget {
  final IconData icon;
  final String value;
  final Function action;
  final bool isSelected;

  FeedCardAction({
    @required this.icon,
    this.action,
    this.value,
    this.isSelected = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 16.0,
              color: isSelected ? TwitterColor.ceriseRed : TwitterColor.paleSky,
            ),
            (value != null
                ? Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        color: TwitterColor.paleSky,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : Container()),
          ],
        ),
      ),
    );
  }
}
