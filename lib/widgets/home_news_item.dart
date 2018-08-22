import 'package:flutter/material.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/utilize/app_options.dart';

class HomeNewsItem extends StatelessWidget {
  HomeNewsItem({Key key, @required this.newsItem})
      : assert(newsItem != null),
        super(key: key);

  final News newsItem;
  static const urgentBG = Color.fromRGBO(255, 41, 41, 1.0);

  @override
  Widget build(BuildContext context) {
    final dTheme = DynamicTheme.of(context);
    bool showImage =
        (newsItem.imageUrl == null || newsItem.imageUrl.trim() == "");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _newsImage(imageUrl: newsItem.imageUrl),
        showImage ? Container() : SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              newsItem.source,
              //style: theme.newsSourceStyle,
            ),
            new Container(
                color: dTheme.urgentBG,
                child: newsItem.isUrgent
                    ? Text(
                        "عاجل",
                        //style: theme.newsUrgentStyle,
                        //style: dy.newsUrgentStyle,
                      )
                    : Container(),
                padding: new EdgeInsets.symmetric(horizontal: 10.0)),
          ],
        ),
        Text(
          newsItem.title,
        ),
        showImage
            ? Text(
                newsItem.description,
                //style: theme.newsDescStyle,
                //style: baseTheme.textTheme.caption,
              )
            : Container(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              newsItem.date,
              //style: baseTheme.textTheme.caption,
            ),
            Icon(
              Icons.bookmark_border,
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Divider(),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class _newsImage extends StatelessWidget {
  _newsImage({Key key, this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl.isEmpty
        ? Container()
        : Container(
            height: 180.0,
            child: FadeInImage.assetNetwork(
              placeholder: "resources/logo.jpg",
              image: imageUrl,
              alignment: Alignment.topCenter,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
  }
}
