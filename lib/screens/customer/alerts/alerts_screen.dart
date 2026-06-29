import 'package:flutter/material.dart';
import '../review/rate_expert_screen.dart';
import '../bookings/customer_booking_detail_screen.dart';
import '../chat/customer_chat_screen.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Notifications',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Mark all read',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _NotifCard(
                    icon: Icons.check_circle_outline_rounded,
                    iconColor: const Color(0xFF22C55E),
                    iconBg: const Color(0xFFDCFCE7),
                    title: 'Booking confirmed',
                    subtitle: 'Rahul Kapoor confirmed your booking SD-48217.',
                    time: '2h ago',
                    unread: true,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CustomerBookingDetailScreen()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _NotifCard(
                    icon: Icons.chat_bubble_outline_rounded,
                    iconColor: const Color(0xFF4158D0),
                    iconBg: const Color(0xFFE0E7FF),
                    title: 'New message',
                    subtitle: 'Adv. Meera Nair sent you a message.',
                    time: '5h ago',
                    unread: true,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CustomerChatScreen()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _NotifCard(
                    icon: Icons.credit_card_rounded,
                    iconColor: const Color(0xFF22C55E),
                    iconBg: const Color(0xFFDCFCE7),
                    title: 'Payment receipt',
                    subtitle: 'Payment of ₹2,999 received for SD-47882.',
                    time: 'Yesterday',
                    unread: false,
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Receipt for SD-47882 · ₹2,999'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _NotifCard(
                    icon: Icons.star_border_rounded,
                    iconColor: const Color(0xFFF59E0B),
                    iconBg: const Color(0xFFFEF3C7),
                    title: 'Rate your expert',
                    subtitle: 'How was your session with Sneha Iyer?',
                    time: '2 days ago',
                    unread: false,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RateExpertScreen()),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotifCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor, iconBg;
  final String title, subtitle, time;
  final bool unread;
  final VoidCallback onTap;

  const _NotifCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.unread,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: unread ? const Color(0xFFF5F7FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                      Row(
                        children: [
                          Text(time,
                              style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                          if (unread) ...[
                            const SizedBox(width: 6),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF4158D0), shape: BoxShape.circle),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
