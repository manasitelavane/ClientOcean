import 'package:flutter/material.dart';
import 'meeting_link_screen.dart';
import 'cancel_booking_screen.dart';
import 'reschedule_booking_screen.dart';
import '../chat/customer_chat_screen.dart';

class CustomerBookingDetailScreen extends StatelessWidget {
  const CustomerBookingDetailScreen({super.key});

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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Booking detail',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                        Text('SD-48217',
                            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E7FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.circle, size: 7, color: Color(0xFF4158D0)),
                        SizedBox(width: 5),
                        Text('Confirmed',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Column(
                  children: [
                    // Progress stepper
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: [
                          _StepDot(label: 'Booked', done: true),
                          _StepLine(done: true),
                          _StepDot(label: 'Confirmed', done: true),
                          _StepLine(done: false),
                          _StepNumber(number: '3', label: 'Progress'),
                          _StepLine(done: false),
                          _StepNumber(number: '4', label: 'Done'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Expert card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text('RK',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Rahul Kapoor',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                                Text('Chartered Accountant',
                                    style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                              ],
                            ),
                          ),
                          _IconBtn(icon: Icons.chat_bubble_outline_rounded,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const CustomerChatScreen()),
                              )),
                          const SizedBox(width: 8),
                          _IconBtn(icon: Icons.phone_outlined, onTap: () {}),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Meeting link card
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const MeetingLinkScreen()),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEF0FA),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE0E7FF)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.videocam_outlined, color: Color(0xFF4158D0), size: 20),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Meeting link ready',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                                  Text('Tap to view & join',
                                      style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Service details
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Column(
                        children: const [
                          _DetailRow(label: 'Service', value: 'Income Tax Filing'),
                          Divider(height: 20, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Date & time', value: 'Tue, 18 Jun, 11:00 AM'),
                          Divider(height: 20, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Mode', value: 'Online'),
                          Divider(height: 20, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Amount paid', value: '₹1,499'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Document
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEE2E2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.insert_drive_file_outlined,
                                color: Color(0xFFEF4444), size: 20),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PAN_card.pdf',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                                Text('Shared with expert',
                                    style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                              ],
                            ),
                          ),
                          const Icon(Icons.remove_red_eye_outlined, color: Color(0xFF9CA3AF), size: 20),
                        ],
                      ),
                    ),

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const RescheduleBookingScreen()),
                ),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF4158D0)),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_outlined,
                            color: Color(0xFF4158D0), size: 16),
                        SizedBox(width: 8),
                        Text('Reschedule',
                            style: TextStyle(
                                color: Color(0xFF4158D0),
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const CancelBookingScreen()),
                      ),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color(0xFFEF4444)),
                        ),
                        child: const Center(
                          child: Text('Cancel',
                              style: TextStyle(
                                  color: Color(0xFFEF4444),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const CustomerChatScreen()),
                      ),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.chat_bubble_outline_rounded,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 8),
                              Text('Message expert',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepDot extends StatelessWidget {
  final String label;
  final bool done;
  const _StepDot({required this.label, required this.done});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
      ],
    );
  }
}

class _StepLine extends StatelessWidget {
  final bool done;
  const _StepLine({required this.done});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 14),
        color: done ? const Color(0xFF4158D0) : const Color(0xFFE5E7EB),
      ),
    );
  }
}

class _StepNumber extends StatelessWidget {
  final String number, label;
  const _StepNumber({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Center(
            child: Text(number,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF9CA3AF))),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF))),
      ],
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFEEF0FA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF4158D0), size: 18),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label, value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
        Text(value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
      ],
    );
  }
}
