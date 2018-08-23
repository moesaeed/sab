import 'package:flutter/material.dart';
import 'package:sab/sab_data.dart';
import 'package:sab/sab_types.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/utilize/app_options.dart';
import 'package:sab/widgets/home_event_item.dart';
import 'package:sab/widgets/home_news_item.dart';

class HomeList extends StatelessWidget {
  List<ListItem> items = allData;
  int drawEventTitle = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final ListItem item = items[index];

        if (item is News) {
          return HomeNewsItem(item: items[index]);
        } else if (item is Events) {
          drawEventTitle++;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                drawEventTitle == 0
                    ? HomeCategoryTitle(
                        title: TranslationBase.of(context).events)
                    : Container(),
                HomeEventItem(
                  item: item,
                )
              ]);
        }
      },
    );
  }
}

class HomeCategoryTitle extends StatelessWidget {
  HomeCategoryTitle({Key key, @required this.title})
      : assert(title != null && title.isNotEmpty),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final dTheme = DynamicTheme.of(context);
    return Row(
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Container(
          color: dTheme.urgentBG,
          width: 8.0,
          height: 25.0,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: dTheme.newsCategoryTitleStyle,
        ),
      ],
    );
  }
}
