import 'package:flutter/material.dart';
import 'package:hotel_sunshine/providers/hotel_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';


class DateExpansionTile extends StatefulWidget {
  final bool isCheckIn;
  final String title;

  DateExpansionTile({required this.isCheckIn, required this.title});

  @override
  _DateExpansionTileState createState() => _DateExpansionTileState();
}

class _DateExpansionTileState extends State<DateExpansionTile> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.title),
      initiallyExpanded: _isExpanded,
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            if (widget.isCheckIn) {
              Provider.of<HotelProvider>(context, listen: false).selectCheckInDate(selectedDay);
            } else {
              Provider.of<HotelProvider>(context, listen: false).selectCheckOutDate(selectedDay);
            }
          },
          calendarFormat: CalendarFormat.month,
        ),
      ],
    );
  }
}
