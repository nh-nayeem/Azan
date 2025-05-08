import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class scheduleazan {
  static Future todaysSchedule() async{
    List<String> _log = ['', '', '', '', ''];
    final _rawdata = await rootBundle.loadString("assets/namaztime.csv");
    List<List<dynamic>> _calender = await const CsvToListConverter().convert(_rawdata);
    //   days in month      0, 0, 31, 29, 31,  30,  31,  30,  31,  31,  30,  31,  30,  31 
    const List<int> days = [0, 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];
    DateTime _today = DateTime.now();
    int today_index = days[_today.month] + _today.day;
    for (int i = 0, j = 0; i < 10; i = i + 2, j++) {
      String apm = 'am';
      int namazhour = _calender[today_index][i];
      int namazminuite = _calender[today_index][i + 1];
      if (namazhour > 12) {
        apm = 'pm';
        namazhour -= 12;
      }
      _log[j] = _calender[0][i].toString().padRight(7,' ') +
       ': ' + namazhour.toString().padLeft(2,'0') +
       ':' + namazminuite.toString().padLeft(2, '0') + apm;
    }
    return _log;
  }
}