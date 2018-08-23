import 'package:flutter/material.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/utilize/app_options.dart';

class HomeNewsItem extends StatelessWidget {
  HomeNewsItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final News item;

  @override
  Widget build(BuildContext context) {
    final dTheme = DynamicTheme.of(context);
    bool showImage = (item.imageUrl == null || item.imageUrl.trim() == "");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        showImage
            ? Container()
            : Hero(
                tag: item.iD,
                child: Container(
                  height: 180.0,
                  child: FadeInImage.assetNetwork(
                    placeholder: "resources/logo.jpg",
                    image: item.imageUrl,
                    alignment: Alignment.topCenter,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        showImage ? Container() : SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.source,
              style: dTheme.newsSourceStyle,
            ),
            new Container(
                color: dTheme.urgentBG,
                child: item.isUrgent
                    ? Text(
                        "عاجل",
                        style: dTheme.newsUrgentStyle,
                      )
                    : Container(),
                padding: new EdgeInsets.symmetric(horizontal: 10.0)),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetails(item: item),
              ),
            );
          },
          child: Text(
            item.title,
          ),
        ),
        showImage
            ? Text(
                item.description,
                style: dTheme.newsDescStyle,
              )
            : Container(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.date,
              style: dTheme.newsDateStyle,
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

class NewsDetails extends StatelessWidget {
  NewsDetails({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final News item;

  @override
  Widget build(BuildContext context) {
    final dTheme = DynamicTheme.of(context);
    bool showImage = (item.imageUrl == null || item.imageUrl.trim() == "");
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                showImage
                    ? Container()
                    : Hero(
                        tag: item.iD,
                        child: Container(
                          height: 250.0,
                          child: FadeInImage.assetNetwork(
                            placeholder: "resources/logo.jpg",
                            image: item.imageUrl,
                            alignment: Alignment.topCenter,
                            height: double.infinity,
                            width: double.infinity,
                            //fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                showImage ? Container() : SizedBox(height: 10.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      item.source,
                      style: dTheme.newsSourceStyle,
                    ),
                    new Container(
                        color: dTheme.urgentBG,
                        child: item.isUrgent
                            ? Text(
                                "عاجل",
                                style: dTheme.newsUrgentStyle,
                              )
                            : Container(),
                        padding: new EdgeInsets.symmetric(horizontal: 10.0)),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(item: item),
                      ),
                    );
                  },
                  child: Text(
                    item.title,
                  ),
                ),
                Text(
                  item.description,
                  style: dTheme.newsDescStyle,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      item.date,
                      style: dTheme.newsDateStyle,
                    ),
                    Icon(
                      Icons.bookmark_border,
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ));
  }
}
