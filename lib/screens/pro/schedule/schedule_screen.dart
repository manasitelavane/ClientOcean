import 'package:flutter/material.dart';
import '../booking/booking_detail_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedDay = 2; // Tuesday (index 2)

  final List<_Day> _days = [
    _Day(label: 'Mon', date: '16'),
    _Day(label: 'Tue', date: '17'),
    _Day(label: 'Tue', date: '18'),
    _Day(label: 'Wed', date: '19'),
    _Day(label: 'Thu', date: '20'),
    _Day(label: 'Fri', date: '21'),
    _Day(label: 'Sat', date: '22'),
  ];

  final List<_Appointment> _appointments = [
    _Appointment(
        time: '11:00\nAM',
        title: 'Income Tax Filing',
        subtitle: 'Priya Sharma · Online'),
    _Appointment(
        time: '1:00\nPM',
        title: 'GST Registration',
        subtitle: 'Anita Roy · Office visit'),
    _Appointment(
        time: '5:00\nPM',
        title: 'Tax Consultation',
        subtitle: 'Karan Mehta · Online'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: const Text('Schedule',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0D0D2B))),
            ),
            const SizedBox(height: 16),
            // Day selector
            SizedBox(
              height: 72,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _days.length,
                itemBuilder: (ctx, i) {
                  final d = _days[i];
                  final isSelected = i == _selectedDay;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDay = i),
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                    Color(0xFF4DD0E1),
                                    Color(0xFF4158D0)
                                  ])
                            : null,
                        color: isSelected ? null : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            d.label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.white70
                                  : const Color(0xFF9CA3AF),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            d.date,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF0D0D2B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _appointments.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (ctx, i) {
                  final apt = _appointments[i];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const BookingDetailScreen()),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 52,
                            child: Text(
                              apt.time,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4158D0),
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 36,
                            color: const Color(0xFFE5E7EB),
                            margin: const EdgeInsets.symmetric(horizontal: 14),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(apt.title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF0D0D2B))),
                                const SizedBox(height: 2),
                                Text(apt.subtitle,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF6B7280))),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              color: Color(0xFFD1D5DB)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Day {
  final String label, date;
  const _Day({required this.label, required this.date});
}

class _Appointment {
  final String time, title, subtitle;
  const _Appointment(
      {required this.time, required this.title, required this.subtitle});
}
