import 'package:flutter/material.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/utilize/app_options.dart';
import 'package:sab/widgets/news_details.dart';

class HomeNewsItem extends StatelessWidget {
  HomeNewsItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final News item;

  @override
  Widget build(BuildContext context) {
    final dTheme = AppOptions.of(context);
    bool showImage = (item.imageUrl == null || item.imageUrl.trim() == "");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        showImage
            ? Container()
            : CustomInkWell(
                item: item,
                child: Hero(
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
        new CustomInkWell(
            item: item,
            child: Text(
              item.title,
              style: dTheme.newsTitleStyle,
            )),
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

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    Key key,
    @required this.item,
    @required this.child,
  }) : super(key: key);

  final News item;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(item: item),
          ),
        );
      },
      child: child,
    );
  }
}
