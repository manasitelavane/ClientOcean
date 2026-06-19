import 'package:flutter/material.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  final List<_DayItem> _days = [
    _DayItem(label: 'Mon', isActive: true, start: '9:00 AM', end: '6:00 PM'),
    _DayItem(label: 'Tue', isActive: true, start: '9:00 AM', end: '6:00 PM'),
    _DayItem(label: 'Wed', isActive: true, start: '9:00 AM', end: '6:00 PM'),
    _DayItem(label: 'Thu', isActive: true, start: '9:00 AM', end: '6:00 PM'),
    _DayItem(label: 'Fri', isActive: true, start: '9:00 AM', end: '6:00 PM'),
    _DayItem(label: 'Sat', isActive: false, start: '', end: ''),
    _DayItem(label: 'Sun', isActive: false, start: '', end: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F4FF),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 16, color: Color(0xFF0D0D2B)),
            ),
          ),
        ),
        title: const Text('Availability',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D0D2B))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Set the days and hours you're available for bookings.",
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _days.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                  itemBuilder: (ctx, i) {
                    final day = _days[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 36,
                            child: Text(
                              day.label,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: day.isActive
                                    ? const Color(0xFF0D0D2B)
                                    : const Color(0xFFD1D5DB),
                              ),
                            ),
                          ),
                          Expanded(
                            child: day.isActive
                                ? Text(
                                    '${day.start} – ${day.end}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF6B7280)),
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Switch(
                            value: day.isActive,
                            onChanged: (v) => setState(() => day.isActive = v),
                            activeTrackColor: const Color(0xFF4158D0),
                            activeThumbColor: Colors.white,
                            inactiveTrackColor: const Color(0xFFD1D5DB),
                            inactiveThumbColor: Colors.white,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text('Save availability',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DayItem {
  String label, start, end;
  bool isActive;
  _DayItem({
    required this.label,
    required this.isActive,
    required this.start,
    required this.end,
  });
}
