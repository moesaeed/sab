import 'package:flutter/material.dart';
import 'package:sab/drawer.dart';
import 'package:sab/sab_data.dart';
import 'package:sab/sab_theme.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/translations_delegate_base.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SABBaseTheme theme = SABBaseTheme.of(context);
    List<ListItem> items = allData;
    int isDrawEventTitle = -1;

    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        title: Text(TranslationBase.of(context).home),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final ListItem item = items[index];

            if (item is News) {
              return _newsWithImage(item, theme);
            } else if (item is Events) {
              isDrawEventTitle++;
              return _event(item, theme, (isDrawEventTitle == 0),
                  TranslationBase.of(context).events);
            }
          },
        ),
      ),
    );
  }

  Column _newsWithImage(News item, SABBaseTheme theme) {
    bool showImage = (item.imageUrl == null || item.imageUrl.trim() == "");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _newsImag(item.imageUrl),
        showImage ? Container() : SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.source,
              style: theme.newsSourceStyle,
            ),
            new Container(
                color: urgentBG,
                child: item.isUrgent
                    ? Text(
                        "عاجل",
                        style: theme.newsUrgentStyle,
                      )
                    : Container(),
                padding: new EdgeInsets.symmetric(horizontal: 10.0)),
          ],
        ),
        Text(
          item.title,
        ),
        showImage
            ? Text(
                item.description,
                style: theme.newsDescStyle,
              )
            : Container(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.date,
              style: theme.newsDateStyle,
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

  Container _newsImag(String imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return Container();
    }

    return Container(
      height: 180.0,
      child: FadeInImage.assetNetwork(
        placeholder: "resources/logo.jpg",
        image: imageUrl,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Container _eventImag(String imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return Container();
    }

    return Container(
      width: 100.0,
      child: FadeInImage.assetNetwork(
        placeholder: "resources/logo.jpg",
        image: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _event(
      Events item, SABBaseTheme theme, bool drawHeader, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        drawHeader
            ? Row(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    color: urgentBG,
                    width: 8.0,
                    height: 25.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    title,
                    style: theme.newsCategoryTitleStyle,
                  ),
                ],
              )
            : Container(),
        SizedBox(height: drawHeader ? 20.0 : 0.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                item.title,
                overflow: TextOverflow.clip,
                softWrap: true,
                style: theme.newsTitleStyle,
              ),
            ),
            _eventImag(item.imageUrl),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              item.fromDate + " - " + item.toDate,
              style: theme.newsDateStyle,
            ),
            Icon(
              Icons.bookmark_border,
              color: Colors.black38,
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new CustomDrawer(), // new Line
      appBar: new AppBar(
        title: new Text("First Page"),
      ),
      body: new Text("I belongs to First Page"),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new CustomDrawer(), // New Line
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Text("I belongs to Second Page"),
    );
  }
}
