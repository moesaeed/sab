import 'package:sab/sab_types.dart';

const List<News> _allArNews = <News>[
  News(
      title:
          "ديوان المحاسبة يشارك في الاجتماع المشترك لمبادرة تنمية الانتوساي وإدارة الشؤون الاقتصادية والاجتماعية التابعة لهيئة الأمم المتحدة",
      description: "",
      date: "26 يوليه 2018",
      source: "المكتب الاعلامي",
      isUrgent: true,
      imageUrl:
          "https://www.sab.gov.qa/Arabic/Media/News/PublishingImages/ديوان%20المحاسبة%20يشارك%20في%20الاجتماع%20المشترك%20لمبادرة%20تنمية%20الانتوساي%20وإدارة%20الشؤون%20الاقتصادية%20والاجتماعية%20التابعة%20لهيئة%20الأمم%20المتحدة.jpg"),
  News(
      title: "ورشة تعريفية للتدريب الميداني لطالبات جامعة قطر",
      date: "01 يوليه 2018",
      source: "المكتب الاعلامي",
      isUrgent: false,
      imageUrl:
          "https://www.sab.gov.qa/Arabic/Media/News/PublishingImages/SAB%20Tower.jpg",
      description: ""),
  News(
      title: "مركز التميز للتدريب والتطوير يختتم برنامج المعينين الجدد",
      date: "27 سبتمبر 2017	",
      imageUrl: "",
      isUrgent: false,
      source: "الجزيرة",
      description:
          "اختتم مركز التميز للتدريب والتطوير برنامج المعينين الجدد بديوان المحاسبة، والذي جرى خلال الفترة من 25 – 27 سبتمبر 2017. وهدف البرنامج إلى تعريف الموظفين الجدد بقانون ديوان المحاسبة وقيم واخلاقيات العمل."),
  News(
      title:
          "ديوان المحاسبة يختتم البرنامج التدريبي لموظفي وزارة الاقتصاد والتجارة",
      date: "18 مايو 2017",
      source: "المكتب الاعلامي",
      isUrgent: false,
      imageUrl:
          "https://www.sab.gov.qa/Arabic/Media/News/PublishingImages/ديوان%20المحاسبة%20يختتم%20البرنامج%20التدريبي%20لموظفي%20وزارة%20الاقتصاد%20والتجارة1.jpg",
      description: ""),
  News(
      title:
          "رئيس ديوان المحاسبة يصدر قرارات بتعيين مساعدين للرئيس بدرجة وكيل وزارة مساعد",
      date: "19 فبراير 2017",
      isUrgent: false,
      source: "تليفزيون قطر",
      imageUrl:
          "https://www.sab.gov.qa/Arabic/Media/News/PublishingImages/صورة%20الرئيس%20المعتمدة.JPG",
      description:
          "أصدر سعادة الشيخ بندر بن محمد بن سعود ال ثاني – رئيس ديوان المحاسبة قرارات بتعيين مساعدين للرئيس بدرجة وكيل وزارة مساعد ، حيث تضمنت القرارات ما يلي"),
];

const List<Events> _events = <Events>[
  Events(
      title:
          "الاجتماع الخامس والخمسين للمجلس التنفيذي للمنظمة العربية للأجهزة العليا للرقابة المالية والمحاسبة",
      description:
          "يستضيفه ديوان المحاسبة  في دولة قطر الاجتماع الخامس والخمسين للمجلس التنفيذي للمنظمة العربية للأجهزة العليا للرقابة المالية والمحاسبة(الأربوساي) خلال الفترة 28ـ29 مارس 2017 في الدوحة .",
      imageUrl:
          "https://www.sab.gov.qa/Arabic/Media/News/PublishingImages/logoPortal.png",
      fromDate: "28 مارس 2017",
      toDate: "29 مارس 2017 "),
  Events(
      title: "الملتقى العربي الأوربي الخامس",
      description:
          "يعقد الملتقى العربي الأوربي كل عامين بالتناوب بين أجهزة الرقابة العربية والأوربية، ويهدف الملتقى إلى تعزيز التعاون الفني والمؤسسي بين الأجهزة العليا للرقابة في الدول العربية والدول الأوربية",
      imageUrl:
          "https://www.sab.gov.qa/Arabic/Media/News/PublishingImages/صورة%20جماعية.jpg",
      fromDate: "07 ديسمبر 2015",
      toDate: "09 ديسمبر 2015")
];

int _counter = -1;
List<ListItem> allData =
    List<ListItem>.generate(_allArNews.length + _events.length, (i) {
  if (i < _allArNews.length) {
    return _allArNews[i];
  } else {
    _counter++;
    return _events[_counter];
  }
});
