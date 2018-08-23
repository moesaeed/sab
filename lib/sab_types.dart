class News implements ListItem {
  const News(
      {this.title,
      this.description,
      this.imageUrl,
      this.date,
      this.source,
      this.isUrgent,
      this.iD});

  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String source;
  final bool isUrgent;
  final int iD;

  @override
  String toString() => 'Vendor($title)';
}

class Events implements ListItem {
  const Events(
      {this.title,
      this.description,
      this.imageUrl,
      this.fromDate,
      this.toDate});

  final String title;
  final String description;
  final String imageUrl;
  final String fromDate;
  final String toDate;
}

// The base class for the different types of items the List can contain
abstract class ListItem {}
