import 'package:flutter/material.dart';

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  State<NotificationPreferencesScreen> createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends State<NotificationPreferencesScreen> {
  // Booking
  bool _bookingConfirmed = true;
  bool _bookingReminder = true;
  bool _bookingCancelled = true;
  bool _bookingUpdates = true;

  // Payments
  bool _paymentReceipt = true;
  bool _refundAlerts = true;

  // Expert activity
  bool _newMessage = true;
  bool _expertOnline = false;

  // Promotions
  bool _offers = true;
  bool _newExperts = false;
  bool _weeklyDigest = false;

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
                  const Text('Notifications',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionCard(
                      title: 'BOOKINGS',
                      children: [
                        _Toggle(
                          label: 'Booking confirmed',
                          subtitle: 'When an expert accepts your request',
                          value: _bookingConfirmed,
                          onChanged: (v) => setState(() => _bookingConfirmed = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'Appointment reminder',
                          subtitle: '1 hour before your session',
                          value: _bookingReminder,
                          onChanged: (v) => setState(() => _bookingReminder = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'Booking cancelled',
                          subtitle: 'When a booking is cancelled',
                          value: _bookingCancelled,
                          onChanged: (v) => setState(() => _bookingCancelled = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'Status updates',
                          subtitle: 'In-progress and completion alerts',
                          value: _bookingUpdates,
                          onChanged: (v) => setState(() => _bookingUpdates = v),
                          showDivider: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    _SectionCard(
                      title: 'PAYMENTS',
                      children: [
                        _Toggle(
                          label: 'Payment receipt',
                          subtitle: 'After every successful payment',
                          value: _paymentReceipt,
                          onChanged: (v) => setState(() => _paymentReceipt = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'Refund alerts',
                          subtitle: 'When a refund is processed',
                          value: _refundAlerts,
                          onChanged: (v) => setState(() => _refundAlerts = v),
                          showDivider: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    _SectionCard(
                      title: 'EXPERT ACTIVITY',
                      children: [
                        _Toggle(
                          label: 'New message',
                          subtitle: 'When an expert sends you a message',
                          value: _newMessage,
                          onChanged: (v) => setState(() => _newMessage = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'Expert online',
                          subtitle: 'When a saved expert comes online',
                          value: _expertOnline,
                          onChanged: (v) => setState(() => _expertOnline = v),
                          showDivider: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    _SectionCard(
                      title: 'PROMOTIONS',
                      children: [
                        _Toggle(
                          label: 'Offers & discounts',
                          subtitle: 'Exclusive deals for you',
                          value: _offers,
                          onChanged: (v) => setState(() => _offers = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'New experts nearby',
                          subtitle: 'When new experts join your city',
                          value: _newExperts,
                          onChanged: (v) => setState(() => _newExperts = v),
                          showDivider: true,
                        ),
                        _Toggle(
                          label: 'Weekly digest',
                          subtitle: 'Summary of your activity',
                          value: _weeklyDigest,
                          onChanged: (v) => setState(() => _weeklyDigest = v),
                          showDivider: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SectionCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(title,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9CA3AF),
                  letterSpacing: 0.8)),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _Toggle extends StatelessWidget {
  final String label, subtitle;
  final bool value, showDivider;
  final ValueChanged<bool> onChanged;

  const _Toggle({
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: const Color(0xFF4158D0),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xFFE5E7EB),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(height: 1, indent: 16, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}
