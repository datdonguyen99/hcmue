import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:hcmue/public/widgets/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Chào buổi sáng', style: TextStyle(fontSize: 10)),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                menuItem(
                  icon: Icons.payment_outlined,
                  press: () => {},
                ),
                menuItem(
                  icon: Icons.check_circle_outline,
                  press: () => {},
                ),
              ],
            ),
          ),
          // const SizedBox(
          // height: 8,
          // ),
          // Container(
          //   height: 255,
          //   width: 300,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12.0),
          //     color: Colors.white,
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: TableCalendar(
          //       rowHeight: 52,
          //       firstDay: DateTime.utc(2022, 7, 1),
          //       lastDay: DateTime.utc(2030, 3, 14),
          //       focusedDay: DateTime.now(),
          //       shouldFillViewport: true,
          //       daysOfWeekHeight: 15,
          //       calendarStyle: const CalendarStyle(
          //         defaultTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         weekendTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         todayTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         holidayTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         outsideTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         disabledTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         rangeEndTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         selectedTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         rangeStartTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //         withinRangeTextStyle: TextStyle(
          //           fontSize: 10,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
