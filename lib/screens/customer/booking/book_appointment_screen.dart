import 'package:flutter/material.dart';
import 'upload_documents_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int _selectedDay = 2;
  int _selectedSlot = 2;
  int _selectedMode = 0;

  final _days = const [
    ('Mon', '16'), ('Tue', '17'), ('Tue', '18'), ('Wed', '19'), ('Thu', '20'), ('Fri', '21'),
  ];

  final _slots = const [
    '09:00 AM', '10:00 AM', '11:00 AM',
    '12:00 PM', '02:00 PM', '03:00 PM',
    '04:30 PM', '05:30 PM',
  ];

  final _modes = const [
    (Icons.videocam_outlined, 'Online', 'Meet over video call'),
    (Icons.business_center_outlined, 'Office visit', 'Visit expert\'s office'),
    (Icons.home_outlined, 'Home visit', 'Expert comes to you'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Book appointment',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                      Text('Rahul Kapoor',
                          style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select date · June 2026',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),

                    // Day picker
                    Row(
                      children: List.generate(_days.length, (i) {
                        final active = i == _selectedDay;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedDay = i),
                            child: Container(
                              margin: EdgeInsets.only(right: i < _days.length - 1 ? 6 : 0),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                gradient: active
                                    ? const LinearGradient(
                                        colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                                    : null,
                                color: active ? null : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(_days[i].$1,
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: active ? Colors.white.withValues(alpha: 0.8) : const Color(0xFF9CA3AF))),
                                  const SizedBox(height: 2),
                                  Text(_days[i].$2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: active ? Colors.white : const Color(0xFF0D0D2B))),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 24),
                    const Text('Available slots',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),

                    // Time slots grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.4,
                      ),
                      itemCount: _slots.length,
                      itemBuilder: (context, i) {
                        final active = i == _selectedSlot;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedSlot = i),
                          child: Container(
                            decoration: BoxDecoration(
                              color: active ? const Color(0xFFEEF0FA) : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: active ? const Color(0xFF4158D0) : const Color(0xFFE5E7EB),
                                width: active ? 1.5 : 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _slots[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                                  color: active ? const Color(0xFF4158D0) : const Color(0xFF374151),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    const Text('Delivery mode',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),

                    // Delivery mode
                    ...List.generate(_modes.length, (i) {
                      final active = i == _selectedMode;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedMode = i),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: active ? const Color(0xFF4158D0) : const Color(0xFFE5E7EB),
                              width: active ? 1.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: active ? const Color(0xFFE0E7FF) : const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(_modes[i].$1,
                                    color: active ? const Color(0xFF4158D0) : const Color(0xFF9CA3AF),
                                    size: 20),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_modes[i].$2,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: active ? const Color(0xFF0D0D2B) : const Color(0xFF374151))),
                                    Text(_modes[i].$3,
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                                  ],
                                ),
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: active
                                      ? const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                                      : null,
                                  border: active ? null : Border.all(color: const Color(0xFFD1D5DB)),
                                  color: active ? null : Colors.white,
                                ),
                                child: active
                                    ? const Icon(Icons.check, color: Colors.white, size: 14)
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const UploadDocumentsScreen()),
            ),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('Continue  →',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
