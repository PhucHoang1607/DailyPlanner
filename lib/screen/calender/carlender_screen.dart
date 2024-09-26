import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/utilities/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CarlenderScreen extends StatefulWidget {
  const CarlenderScreen({super.key});

  @override
  State<CarlenderScreen> createState() => _CarlenderScreenState();
}

class _CarlenderScreenState extends State<CarlenderScreen> {
  DateTime foucusDate = DateTime.now();
  DateTime? _selectedDate;
  var instanceData = taskData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Calender'),
      ),
      body: Container(
        child: TableCalendar(
          firstDay: DateTime.utc(2017, 01, 01),
          lastDay: DateTime.utc(2037, 01, 01),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
          onDaySelected: (selectedDate, foucusDate) {
            setState(() {
              _selectedDate = selectedDate;
              foucusDate = foucusDate;
            });
          },
        ),
      ),
    );
  }
}
