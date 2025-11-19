import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarCard extends StatefulWidget {
  const CalendarCard({Key? key}) : super(key: key);
  @override
  State<CalendarCard> createState() => _CalendarCardState();
}


class _CalendarCardState extends State<CalendarCard> {
  DateTime _focused = DateTime.now();
  DateTime? _selected;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('General', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${_focused.month}/${_focused.year}'),
            ],
          ),
          const SizedBox(height: 8),
          TableCalendar(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focused,
            selectedDayPredicate: (day) => isSameDay(_selected, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selected = selectedDay;
                _focused = focusedDay;
              });
            },
            headerVisible: false,
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
            ),
          )
        ],
      ),
    );
  }
}