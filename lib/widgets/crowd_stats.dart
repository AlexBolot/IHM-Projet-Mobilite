import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CrowdGraph extends StatefulWidget {
  final WeekDay day;

  CrowdGraph(this.day);

  @override
  _CrowdGraphState createState() => _CrowdGraphState();
}

class _CrowdGraphState extends State<CrowdGraph> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 200),
      // adjust the height here
      child: charts.BarChart(
        [
          new charts.Series<CrowdData, String>(
            id: 'Affluence',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (CrowdData data, _) => data.hour,
            measureFn: (CrowdData data, _) => data.crowdQuantity,
            data: getDataForDay(widget.day),
          )
        ],
        animate: true,
      ), // place your chart here
    );
  }

  getDataForDay(day) {
    switch (day) {
      case WeekDay.MONDAY:
        return mondayInfos;
      case WeekDay.TUESDAY:
        return tuesdayInfos;
      case WeekDay.WEDNESDAY:
        return wednesdayInfos;
      case WeekDay.THURSDAY:
        return thursdayInfos;
      case WeekDay.FRIDAY:
        return fridayInfos;
      case WeekDay.SATURDAY:
        return saturdayInfos;
      case WeekDay.SUNDAY:
        return sundayInfos;
    }
  }
}

/// Chart data type
class CrowdData {
  final String hour;
  final int crowdQuantity;

  CrowdData(this.hour, this.crowdQuantity);
}

enum WeekDay { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

final mondayInfos = [
  new CrowdData('8h', 5),
  new CrowdData('10h', 25),
  new CrowdData('12h', 90),
  new CrowdData('14h', 50),
  new CrowdData('16h', 40),
  new CrowdData('18h', 95),
  new CrowdData('20h', 60),
];

final tuesdayInfos = [
  new CrowdData('8h', 5),
  new CrowdData('10h', 20),
  new CrowdData('12h', 75),
  new CrowdData('14h', 70),
  new CrowdData('16h', 35),
  new CrowdData('18h', 80),
  new CrowdData('20h', 60),
];

final wednesdayInfos = [
  new CrowdData('8h', 5),
  new CrowdData('10h', 25),
  new CrowdData('12h', 90),
  new CrowdData('14h', 65),
  new CrowdData('16h', 50),
  new CrowdData('18h', 90),
  new CrowdData('20h', 60),
];

final thursdayInfos = [
  new CrowdData('8h', 5),
  new CrowdData('10h', 25),
  new CrowdData('12h', 70),
  new CrowdData('14h', 50),
  new CrowdData('16h', 40),
  new CrowdData('18h', 95),
  new CrowdData('20h', 60),
];

final fridayInfos = [
  new CrowdData('8h', 5),
  new CrowdData('10h', 25),
  new CrowdData('12h', 60),
  new CrowdData('14h', 80),
  new CrowdData('16h', 40),
  new CrowdData('18h', 95),
  new CrowdData('20h', 60),
];

final saturdayInfos = [
  new CrowdData('8h', 5),
  new CrowdData('10h', 45),
  new CrowdData('12h', 95),
  new CrowdData('14h', 90),
  new CrowdData('16h', 80),
  new CrowdData('18h', 95),
  new CrowdData('20h', 75),
];

final sundayInfos = [
  new CrowdData('8h', 0),
  new CrowdData('10h', 0),
  new CrowdData('12h', 0),
  new CrowdData('14h', 0),
  new CrowdData('16h', 0),
  new CrowdData('18h', 0),
  new CrowdData('20h', 0),
];
