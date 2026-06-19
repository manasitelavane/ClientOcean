import 'package:flutter/material.dart';
import '../booking/booking_detail_screen.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Requests',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0D0D2B),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '2 new booking requests',
                    style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _RequestCard(
                    bookingId: 'SD-48310',
                    timeAgo: '8 min ago',
                    initials: 'VS',
                    avatarColor: const Color(0xFF4158D0),
                    customerName: 'Vikram Singh',
                    service: 'Income Tax Filing',
                    price: '₹1,499',
                    date: 'Tue, 18 Jun',
                    time: '3:00 PM',
                    mode: 'Online',
                    modeColor: const Color(0xFF22C55E),
                    modeBg: const Color(0xFFDCFCE7),
                    onAccept: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const BookingDetailScreen()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _RequestCard(
                    bookingId: 'SD-48305',
                    timeAgo: '40 min ago',
                    initials: 'DM',
                    avatarColor: const Color(0xFF4DD0E1),
                    customerName: 'Deepa Menon',
                    service: 'GST Registration',
                    price: '₹2,999',
                    date: 'Wed, 19 Jun',
                    time: '11:00 AM',
                    mode: 'Office visit',
                    modeColor: const Color(0xFF6B7280),
                    modeBg: const Color(0xFFF3F4F6),
                    onAccept: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const BookingDetailScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final String bookingId, timeAgo, initials, customerName, service, price;
  final String date, time, mode;
  final Color modeColor, modeBg, avatarColor;
  final VoidCallback onAccept;

  const _RequestCard({
    required this.bookingId,
    required this.timeAgo,
    required this.initials,
    required this.avatarColor,
    required this.customerName,
    required this.service,
    required this.price,
    required this.date,
    required this.time,
    required this.mode,
    required this.modeColor,
    required this.modeBg,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bookingId,
                  style: const TextStyle(
                      fontSize: 12, color: Color(0xFF9CA3AF))),
              Text(timeAgo,
                  style: const TextStyle(
                      fontSize: 12, color: Color(0xFF9CA3AF))),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration:
                    BoxDecoration(color: avatarColor, shape: BoxShape.circle),
                child: Center(
                  child: Text(initials,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customerName,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D0D2B))),
                    Text(service,
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xFF6B7280))),
                  ],
                ),
              ),
              Text(price,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0D0D2B))),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _chip(Icons.calendar_today_outlined, date,
                  const Color(0xFF6B7280), const Color(0xFFF3F4F6)),
              _chip(Icons.access_time_outlined, time,
                  const Color(0xFF6B7280), const Color(0xFFF3F4F6)),
              _modeChip(mode, modeColor, modeBg),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Decline',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF374151))),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: onAccept,
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('Accept',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _modeChip(String label, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(label,
          style: TextStyle(
              fontSize: 12, color: color, fontWeight: FontWeight.w500)),
    );
  }
}
