import 'package:cooking/components/style.dart';
import 'package:cooking/screens/views/add_purchases.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CalendarCustom extends StatefulWidget {
  const CalendarCustom({super.key});

  @override
  State<CalendarCustom> createState() => _CalendarCustomState();
}

class _CalendarCustomState extends State<CalendarCustom> {
  selectedDay(day, focusedDay) {
    setState(() {
      date = day;
      formatterDateNow = DateFormat('dd.MM.yyyy').format(date);
      dateText = formatterDateNow.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2.6,
      width: MediaQuery.sizeOf(context).width,
      child: TableCalendar(
        daysOfWeekHeight: 24,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Color.fromRGBO(64, 89, 89, 1),
            fontSize: 10,
            fontWeight: FontWeight.w300,
            fontFamily: 'Source_Sans',
          ),
          weekendStyle: TextStyle(
            color: Color.fromRGBO(64, 89, 89, 1),
            fontSize: 10,
            fontWeight: FontWeight.w300,
            fontFamily: 'Source_Sans',
          ),
        ),
        calendarStyle: CalendarStyle(
          tableBorder: TableBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          outsideTextStyle: TextStyle(
            color: Colors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w300,
            fontFamily: 'Source_Sans',
          ),
          weekendTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Source_Sans',
          ),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          todayTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.w300,
            fontFamily: 'Source_Sans',
          ),
          selectedDecoration: BoxDecoration(
            color: greenColor,
            shape: BoxShape.circle,
          ),
          disabledTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Source_Sans',
          ),
          defaultTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Source_Sans',
          ),
          selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Source_Sans',
          ),
        ),
        rowHeight: 30,
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: greenColor)),
          ),
          titleTextFormatter: (date, locale) {
            return DateFormat.yMMM(locale).format(date);
          },
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Source_Sans',
            fontWeight: FontWeight.w400,
          ),
          leftChevronMargin: EdgeInsets.zero,
          leftChevronIcon: SvgPicture.asset('assets/icons/calendar_back.svg'),
          rightChevronPadding: EdgeInsets.zero,
          rightChevronIcon: SvgPicture.asset('assets/icons/calendar_next.svg'),
          formatButtonVisible: false,
          titleCentered: true,
        ),
        sixWeekMonthsEnforced: true,
        onDisabledDayTapped: (day) => selectedDay(day, date),
        selectedDayPredicate: (day) => isSameDay(day, date),
        onDaySelected: selectedDay,
        locale: 'ru_RU',
        focusedDay: date,
        firstDay: date,
        lastDay: DateTime.utc(2030, 12, 31),
      ),
    );
  }
}
