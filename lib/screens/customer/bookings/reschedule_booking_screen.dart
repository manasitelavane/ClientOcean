import 'package:flutter/material.dart';

class RescheduleBookingScreen extends StatefulWidget {
  const RescheduleBookingScreen({super.key});

  @override
  State<RescheduleBookingScreen> createState() =>
      _RescheduleBookingScreenState();
}

class _RescheduleBookingScreenState extends State<RescheduleBookingScreen> {
  int _selectedDay = 1;
  int _selectedSlot = -1;

  final List<_DayItem> _days = const [
    _DayItem(day: 'Mon', date: '16'),
    _DayItem(day: 'Tue', date: '17'),
    _DayItem(day: 'Wed', date: '18'),
    _DayItem(day: 'Thu', date: '19'),
    _DayItem(day: 'Fri', date: '20'),
    _DayItem(day: 'Sat', date: '21'),
    _DayItem(day: 'Sun', date: '22'),
  ];

  final List<String> _morningSlots = [
    '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM',
  ];
  final List<String> _afternoonSlots = [
    '12:00 PM', '12:30 PM', '1:00 PM', '2:00 PM', '3:00 PM', '3:30 PM',
  ];
  final List<String> _eveningSlots = [
    '4:00 PM', '5:00 PM', '5:30 PM', '6:00 PM',
  ];

  final List<int> _unavailableSlots = [2, 4, 7, 11];

  String get _selectedSlotLabel {
    if (_selectedSlot < 0) return '';
    final all = [..._morningSlots, ..._afternoonSlots, ..._eveningSlots];
    if (_selectedSlot >= all.length) return '';
    return all[_selectedSlot];
  }

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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 8)
                        ],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new,
                          size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Reschedule',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0D0D2B))),
                        Text('SD-48217',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF6B7280))),
                      ],
                    ),
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
                    // Current booking card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8)
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text('RK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Income Tax Filing',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF0D0D2B))),
                                Text('Rahul Kapoor',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF6B7280))),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF3C7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text('Current: Tue, 18 Jun',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFD97706))),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Date picker
                    const Text('Select new date',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 72,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _days.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemBuilder: (context, i) {
                          final selected = i == _selectedDay;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedDay = i),
                            child: Container(
                              width: 52,
                              decoration: BoxDecoration(
                                gradient: selected
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFF4DD0E1),
                                          Color(0xFF4158D0)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : null,
                                color: selected ? null : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black
                                          .withValues(alpha: 0.04),
                                      blurRadius: 6)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_days[i].day,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: selected
                                              ? Colors.white70
                                              : const Color(0xFF9CA3AF))),
                                  const SizedBox(height: 4),
                                  Text(_days[i].date,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: selected
                                              ? Colors.white
                                              : const Color(0xFF0D0D2B))),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Time slots
                    const Text('Select time slot',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 4),
                    const Text('Jun 2026 · IST',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                    const SizedBox(height: 16),

                    _SlotSection(
                      label: 'Morning',
                      icon: Icons.wb_sunny_outlined,
                      slots: _morningSlots,
                      offset: 0,
                      selectedSlot: _selectedSlot,
                      unavailable: _unavailableSlots,
                      onTap: (i) => setState(() => _selectedSlot = i),
                    ),
                    const SizedBox(height: 16),
                    _SlotSection(
                      label: 'Afternoon',
                      icon: Icons.wb_cloudy_outlined,
                      slots: _afternoonSlots,
                      offset: _morningSlots.length,
                      selectedSlot: _selectedSlot,
                      unavailable: _unavailableSlots,
                      onTap: (i) => setState(() => _selectedSlot = i),
                    ),
                    const SizedBox(height: 16),
                    _SlotSection(
                      label: 'Evening',
                      icon: Icons.nights_stay_outlined,
                      slots: _eveningSlots,
                      offset: _morningSlots.length + _afternoonSlots.length,
                      selectedSlot: _selectedSlot,
                      unavailable: _unavailableSlots,
                      onTap: (i) => setState(() => _selectedSlot = i),
                    ),
                    const SizedBox(height: 100),
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
            onTap: _selectedSlot < 0
                ? null
                : () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Reschedule requested · ${_days[_selectedDay].day} ${_days[_selectedDay].date} Jun, $_selectedSlotLabel'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 56,
              decoration: BoxDecoration(
                gradient: _selectedSlot >= 0
                    ? const LinearGradient(
                        colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                    : null,
                color: _selectedSlot < 0 ? const Color(0xFFE5E7EB) : null,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  _selectedSlot >= 0
                      ? 'Confirm reschedule  →'
                      : 'Select a time slot',
                  style: TextStyle(
                      color: _selectedSlot >= 0
                          ? Colors.white
                          : const Color(0xFF9CA3AF),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DayItem {
  final String day, date;
  const _DayItem({required this.day, required this.date});
}

class _SlotSection extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<String> slots;
  final int offset, selectedSlot;
  final List<int> unavailable;
  final void Function(int) onTap;

  const _SlotSection({
    required this.label,
    required this.icon,
    required this.slots,
    required this.offset,
    required this.selectedSlot,
    required this.unavailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: const Color(0xFF9CA3AF)),
            const SizedBox(width: 6),
            Text(label,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280))),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(slots.length, (i) {
            final globalIndex = offset + i;
            final isUnavailable = unavailable.contains(globalIndex);
            final isSelected = selectedSlot == globalIndex;
            return GestureDetector(
              onTap: isUnavailable ? null : () => onTap(globalIndex),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                      : null,
                  color: isUnavailable
                      ? const Color(0xFFF9FAFB)
                      : isSelected
                          ? null
                          : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : isUnavailable
                            ? const Color(0xFFF3F4F6)
                            : const Color(0xFFE5E7EB),
                  ),
                  boxShadow: isUnavailable
                      ? null
                      : [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 4)
                        ],
                ),
                child: Text(
                  slots[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Colors.white
                        : isUnavailable
                            ? const Color(0xFFD1D5DB)
                            : const Color(0xFF374151),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
