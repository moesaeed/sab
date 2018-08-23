import 'package:flutter/material.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/utilize/app_options.dart';

class HomeEventItem extends StatelessWidget {
  HomeEventItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final Events item;

  @override
  Widget build(BuildContext context) {
    final dTheme = AppOptions.of(context);
    bool showImage = (item.imageUrl == null || item.imageUrl.trim() == "");
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                item.title,
                overflow: TextOverflow.clip,
                softWrap: true,
                //style: theme.newsTitleStyle,
              ),
            ),
            showImage
                ? Container()
                : Container(
                    width: 100.0,
                    child: FadeInImage.assetNetwork(
                      placeholder: "resources/logo.jpg",
                      image: item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.fromDate + " - " + item.toDate,
              style: dTheme.newsDateStyle,
            ),
            Icon(
              Icons.bookmark_border,
              color: Colors.black38,
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
