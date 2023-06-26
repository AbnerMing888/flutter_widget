import 'package:intl/intl.dart';

///AUTHOR:AbnerMing
///DATE:2023/6/25
///INTRODUCE:时间工具类
class TimeUtil {
  static const String y_M_d = "yyyy-MM-dd"; //年月日
  static const String y_M_d_w = "yyyy年MM月dd日"; //年月日
  static const String y_M_d_i = "yyyy/MM/dd"; //年月日
  static const String y_M_d_h_m_s = "yyyy-MM-dd hh:mm:ss"; //年月日时分秒
  static const String y_M_d_h_m_s_w = "yyyy年MM月dd日 hh时mm分ss秒"; //年月日时分秒
  static const String y_M_d_h_m_s_i = "yyyy/MM/dd hh:mm:ss"; //年月日时分秒
  static const String M_d = "MM-dd"; //月日
  static const String h_m_s = "hh:mm:ss"; //时分秒
  static const String m_s = "mm:ss"; //分秒

  /*
  * 获取当前时间戳，返回为毫秒
  * */
  static int getTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /*
  * 获取当前时间 DateTime格式
  * */
  static DateTime getDateTimeNow() {
    return DateTime.now();
  }

  /*
  * 日期转时间戳
  *  `"2012-02-27"`
  * `"2012-02-27 13:27:00"`
  * `"2012-02-27 13:27:00.123456789z"`
  * `"2012-02-27 13:27:00,123456789z"`
  * `"20120227 13:27:00"`
  * `"20120227T132700"`
  * `"20120227"`
  * `"+20120227"`
  * `"2012-02-27T14Z"`
  * `"2012-02-27T14+00:00"`
  * `"-123450101 00:00:00 Z"`: in the year -12345.
  * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  * */
  static int getStringDateToTimeStamp(String date) {
    DateTime dateTime = getTimeStampByDataTime(date);
    return dateTime.millisecondsSinceEpoch;
  }

  /*
  * 获取当前日期，返回指定格式
  * */
  static String getNowDateTimeFormat(String outFormat) {
    var format = DateFormat(outFormat);
    DateTime date = DateTime.now();
    String formatResult = format.format(date);
    return formatResult;
  }

  /*
  * 获取以往日期的时间戳，默认返回昨天
  * */
  static int getBeforeTimeStamp({int day = 1}) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch - (24 * 60 * 60 * 1000 * day));
    return dateTime.millisecondsSinceEpoch;
  }

  /*
  * 获取以往日期的时间,可以是昨天，前天，等等
  * */
  static String getBeforeDay(String outFormat, {int day = 1}) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch - (24 * 60 * 60 * 1000 * day));
    var format = DateFormat(outFormat);
    return format.format(dateTime);
  }

  /*
  * 时间戳转时间
  * */
  static String getTimeStampToStringDate(int timeStamp,
      {String format = y_M_d}) {
    var dateFormat = DateFormat(format);
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return dateFormat.format(dateTime);
  }

  /*
  * 获取两个日期之间间隔天数
  * */
  static int getRangeDayNumber(DateTime startData, DateTime endData) {
    if (startData.millisecondsSinceEpoch > endData.millisecondsSinceEpoch) {
      return startData.difference(endData).inDays;
    }
    return endData.difference(startData).inDays;
  }

  /*
  * 和当前时间间隔,时间戳模式
  * */

  static String getRangeTimeNow(int oldTime) {
    //获取当前的时间戳
    var startTimeStamp = getTimeStamp();
    var oldTimeStamp = startTimeStamp - oldTime;
    var startData = DateTime.fromMillisecondsSinceEpoch(startTimeStamp);
    var oldData = DateTime.fromMillisecondsSinceEpoch(oldTimeStamp);
    var difference = startData.difference(oldData);
    var seconds = difference.inSeconds;
    if (seconds < 60) {
      return "$seconds秒前";
    }
    var minutes = difference.inMinutes;
    if (minutes < 60) {
      return "$minutes分钟前";
    }
    var hours = difference.inHours;
    if (hours < 24) {
      return "$hours小时前";
    }
    var days = difference.inDays;
    print(days);
    if (days < 365) {
      return "$days天前";
    }
    return getTimeStampToStringDate(oldTime);
  }

  /*
  * 日期转DateTime
  * */
  static DateTime getTimeStampByDataTime(String date) {
    if (date.contains("年") || date.contains("月") || date.contains("/")) {
      date = date.replaceAll(RegExp(r'年|月|/'), "-");
    }
    if (date.contains("时") || date.contains("分")) {
      date = date.replaceAll(RegExp(r'时|分'), "-");
    }
    if (date.contains("日") || date.contains("秒")) {
      date = date.replaceAll(RegExp(r'日|秒'), "");
    }

    return DateTime.parse(date);
  }

  /*
  * 获取星期几,int类型
  * */
  static int getWeekNumber(DateTime date) {
    var week = date.weekday;
    return week;
  }

  /*
  * 获取星期几
  * */
  static String getWeek(DateTime date, {String tag = "星期"}) {
    var week = date.weekday;
    String w = '';
    switch (week.toString()) {
      case '1':
        w = '一';
        break;
      case '2':
        w = '二';
        break;
      case '3':
        w = '三';
        break;
      case '4':
        w = '四';
        break;
      case '5':
        w = '五';
        break;
      case '6':
        w = '六';
        break;
      case '7':
        w = '日';
        break;
    }
    return '$tag$w';
  }
}
