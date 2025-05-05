import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime selectedDate, String? content) onDateSelected;

  const CalendarWidget({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // ✅ 날짜 선택 시 서버에서 데이터 불러오기
  Future<String?> fetchNote(DateTime date) async {
    final String formattedDate = date.toIso8601String().split("T")[0]; // YYYY-MM-DD
    final uri = Uri.parse('https://your-server.com/api/record?date=$formattedDate');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['note']; // {'note': '배변 이상 있음'} 같은 구조
      } else {
        print("서버 오류: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("네트워크 오류: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) async {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });

        String? note = await fetchNote(selectedDay);

        // ✅ 선택된 날짜와 불러온 데이터를 부모 위젯으로 전달
        widget.onDateSelected(selectedDay, note);
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.blue.shade200,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.orange.shade300,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
