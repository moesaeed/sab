import 'package:flutter/material.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/utilize/app_options.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final News item;

  @override
  Widget build(BuildContext context) {
    final dTheme = AppOptions.of(context);
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
                                TranslationBase.of(context).urgent,
                                style: dTheme.newsUrgentStyle,
                              )
                            : Container(),
                        padding: new EdgeInsets.symmetric(horizontal: 10.0)),
                  ],
                ),
                Text(
                  item.title,
                  style: dTheme.newsTitleStyle,
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
                SizedBox(height: 20.0),
                Text(
                  item.description,
                  style: dTheme.newsDescStyle,
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ));
  }
}
