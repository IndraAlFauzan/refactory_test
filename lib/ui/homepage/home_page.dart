import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refactory_test/constant.dart';
import 'package:intl/intl.dart';
import 'package:refactory_test/provider/signin_provider.dart';
import 'package:refactory_test/ui/homepage/section/header.dart';
import 'package:refactory_test/ui/login_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(' EEE, MMM d yyyy').format(now);
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FF),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            name: user!.displayName!,
            photo: user.photoURL!,
            button: () {
              final provider =
                  Provider.of<SigninProvider>(context, listen: false);
              provider.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              formattedDate,
              style: TextStyle(
                  color: baseColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          TableCalendar(
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            headerVisible: false,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(color: Colors.black),
          ),
        ],
      )),
    );
  }
}
