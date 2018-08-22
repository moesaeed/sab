import 'package:flutter/material.dart';
import 'package:sab/sab_data.dart';
import 'package:sab/sab_types.dart';

class HomeList extends StatelessWidget {
  List<ListItem> items = allData;
  int isDrawEventTitle = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final ListItem item = items[index];

        if (item is News) {
          return Container();
        } else if (item is Events) {
          isDrawEventTitle++;
          return Container();
        }
      },
    );
  }
}
