import 'package:flutter/material.dart';

class ProNotificationsScreen extends StatefulWidget {
  const ProNotificationsScreen({super.key});

  @override
  State<ProNotificationsScreen> createState() =>
      _ProNotificationsScreenState();
}

class _NotifItem {
  final IconData icon;
  final Color iconColor, iconBg;
  final String title, body, time;
  bool isRead;

  _NotifItem({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.body,
    required this.time,
    this.isRead = false,
  });
}

class _ProNotificationsScreenState extends State<ProNotificationsScreen> {
  final List<_NotifItem> _notifs = [
    _NotifItem(
      icon: Icons.calendar_today_outlined,
      iconColor: Color(0xFF4158D0),
      iconBg: Color(0xFFEEF0FA),
      title: 'New booking request',
      body: 'Vikram Singh requested Income Tax Filing for Tue, 18 Jun.',
      time: '8m ago',
    ),
    _NotifItem(
      icon: Icons.account_balance_wallet_outlined,
      iconColor: Color(0xFF22C55E),
      iconBg: Color(0xFFDCFCE7),
      title: 'Payout completed',
      body: '₹18,500 transferred to your HDFC account ••4821.',
      time: '2h ago',
    ),
    _NotifItem(
      icon: Icons.star_rounded,
      iconColor: Color(0xFFF59E0B),
      iconBg: Color(0xFFFEF3C7),
      title: 'New 5-star review',
      body: 'Priya Sharma left you a review on Income Tax Filing.',
      time: '5h ago',
    ),
    _NotifItem(
      icon: Icons.chat_bubble_outline_rounded,
      iconColor: Color(0xFF8B5CF6),
      iconBg: Color(0xFFEDE9FE),
      title: 'New message',
      body: 'Karan Mehta sent you a message about GST Registration.',
      time: '1d ago',
      isRead: true,
    ),
    _NotifItem(
      icon: Icons.check_circle_outline_rounded,
      iconColor: Color(0xFF22C55E),
      iconBg: Color(0xFFDCFCE7),
      title: 'Booking completed',
      body: 'Session with Karan Mehta is marked complete. You earned ₹2,699.',
      time: '2d ago',
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          children: [
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
                    child: Text('Notifications',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D0D2B))),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      for (final n in _notifs) {
                        n.isRead = true;
                      }
                    }),
                    child: const Text('Mark all read',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4158D0))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                itemCount: _notifs.length,
                separatorBuilder: (_, i) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final n = _notifs[i];
                  return GestureDetector(
                    onTap: () => setState(() => n.isRead = true),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8)
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: n.iconBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(n.icon,
                                color: n.iconColor, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(n.title,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF0D0D2B))),
                                    ),
                                    Text(n.time,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF9CA3AF))),
                                    if (!n.isRead) ...[
                                      const SizedBox(width: 6),
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF4158D0),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(n.body,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF6B7280),
                                        height: 1.4)),
                              ],
                            ),
                          ),
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
