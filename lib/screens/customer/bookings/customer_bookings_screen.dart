import 'package:flutter/material.dart';
import 'customer_booking_detail_screen.dart';

class CustomerBookingsScreen extends StatefulWidget {
  const CustomerBookingsScreen({super.key});

  @override
  State<CustomerBookingsScreen> createState() => _CustomerBookingsScreenState();
}

class _CustomerBookingsScreenState extends State<CustomerBookingsScreen> {
  int _tabIndex = 0;
  final _tabs = const ['Upcoming', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text('My bookings',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
            ),
            const SizedBox(height: 16),

            // Tab selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: List.generate(_tabs.length, (i) {
                    final active = i == _tabIndex;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _tabIndex = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: active ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: active
                                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6)]
                                : null,
                          ),
                          child: Text(
                            _tabs[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                              color: active ? const Color(0xFF0D0D2B) : const Color(0xFF9CA3AF),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: _tabIndex == 0
                  ? ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        _BookingCard(
                          id: 'SD-48217',
                          status: 'Confirmed',
                          statusColor: const Color(0xFF4158D0),
                          statusBg: const Color(0xFFE0E7FF),
                          initials: 'RK',
                          avatarColors: const [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                          serviceName: 'Income Tax Filing',
                          expertName: 'Rahul Kapoor',
                          date: 'Tue, 18 Jun',
                          time: '11:00 AM',
                          mode: 'Online',
                          modeColor: const Color(0xFF22C55E),
                          modeBg: const Color(0xFFDCFCE7),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const CustomerBookingDetailScreen()),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _BookingCard(
                          id: 'SD-48109',
                          status: 'Pending',
                          statusColor: const Color(0xFFD97706),
                          statusBg: const Color(0xFFFEF3C7),
                          initials: 'AM',
                          avatarColors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                          serviceName: 'Rent Agreement',
                          expertName: 'Adv. Meera Nair',
                          date: 'Thu, 20 Jun',
                          time: '4:30 PM',
                          mode: 'Home visit',
                          modeColor: const Color(0xFF22C55E),
                          modeBg: const Color(0xFFDCFCE7),
                          onTap: () {},
                        ),
                        const SizedBox(height: 24),
                      ],
                    )
                  : const Center(
                      child: Text('No bookings',
                          style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String id, status, initials, serviceName, expertName, date, time, mode;
  final Color statusColor, statusBg, modeColor, modeBg;
  final List<Color> avatarColors;
  final VoidCallback onTap;

  const _BookingCard({
    required this.id,
    required this.status,
    required this.statusColor,
    required this.statusBg,
    required this.initials,
    required this.avatarColors,
    required this.serviceName,
    required this.expertName,
    required this.date,
    required this.time,
    required this.mode,
    required this.modeColor,
    required this.modeBg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(id, style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 7, color: statusColor),
                      const SizedBox(width: 5),
                      Text(status,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600, color: statusColor)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: avatarColors),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(initials,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(serviceName,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    Text(expertName,
                        style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _Chip(icon: Icons.calendar_today_outlined, label: date,
                    color: const Color(0xFF374151), bg: const Color(0xFFF3F4F6)),
                _Chip(icon: Icons.access_time_rounded, label: time,
                    color: const Color(0xFF374151), bg: const Color(0xFFF3F4F6)),
                _Chip(icon: null, label: mode, color: modeColor, bg: modeBg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color color, bg;
  const _Chip({required this.icon, required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color)),
        ],
      ),
    );
  }
}
