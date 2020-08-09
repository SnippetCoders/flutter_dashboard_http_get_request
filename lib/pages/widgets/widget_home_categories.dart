import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/hex_color.dart';

class DashboardItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildListCategory(context),
        ],
      ),
    );
  }

  _buildListCategory(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      height: 150,
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          makeDashboardItem(
            queryData,
            "Active\nUsers",
            "#3FC379",
            Icon(Icons.verified_user),
            Border(
              right: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            () {},
          ),
          makeDashboardItem(
            queryData,
            "Inactive Users",
            "#FFCD42",
            Icon(Icons.help),
            Border(
              right: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            () {},
          ),
          makeDashboardItem(
            queryData,
            "Deleted\nUsers",
            "#D13839",
            Icon(Icons.delete),
            Border(
              right: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            () {},
          ),
        ],
      ),
    );
  }

  Card makeDashboardItem(
    MediaQueryData query,
    String title,
    String color,
    Icon icon,
    Border border,
    Function onTap,
  ) {
    double width = query.size.width;

    double fontSize = (width * 4) / 100;
    double imageSize = (width * 18) / 100;

    return Card(
      elevation: 5,
      color: HexColor(color),
      margin: new EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: new HexColor(color),
          // border: border,
        ),
        child: Center(
          child: new InkWell(
            onTap: onTap,
            child: FractionalTranslation(
              translation: Offset(0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  //(TabletDetector.isTablet(query)) ?? SizedBox(height: query.size.height * 2 / 100),
                  Center(
                    child: ClipOval(
                      child: Container(
                        //color: HexColor(color),
                        height: imageSize, // height of the button
                        width: imageSize, // width of the button
                        child: Center(child: icon),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  new Center(
                    child: new Text(
                      title.toUpperCase(),
                      style: new TextStyle(
                          fontSize: fontSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
