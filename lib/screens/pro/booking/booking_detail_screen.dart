import 'package:flutter/material.dart';
import '../chat/chat_screen.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

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
        title: const Text('Booking detail',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D0D2B))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.circle, size: 8, color: Color(0xFF22C55E)),
                  SizedBox(width: 4),
                  Text('Confirmed',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF22C55E))),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Booking ID
                  Text('SD-48217',
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFF9CA3AF))),
                  const SizedBox(height: 16),

                  // Customer card
                  Container(
                    padding: const EdgeInsets.all(16),
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
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4158D0),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text('PS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Priya Sharma',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF0D0D2B))),
                              Text('Customer',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF6B7280))),
                            ],
                          ),
                        ),
                        // Chat icon
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const ChatScreen(),
                            ),
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF0FA),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.chat_bubble_outline,
                                size: 18, color: Color(0xFF4158D0)),
                          ),
                        ),
                        // Call icon
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF0FA),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.phone_outlined,
                              size: 18, color: Color(0xFF4158D0)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Service details card
                  Container(
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
                    child: Column(
                      children: [
                        _DetailRow(
                            label: 'Service',
                            value: 'Income Tax Filing'),
                        const Divider(height: 1, color: Color(0xFFF3F4F6)),
                        _DetailRow(
                            label: 'Date & time',
                            value: 'Tue, 18 Jun, 11:00 AM'),
                        const Divider(height: 1, color: Color(0xFFF3F4F6)),
                        _DetailRow(label: 'Mode', value: 'Online'),
                        const Divider(height: 1, color: Color(0xFFF3F4F6)),
                        _DetailRow(
                          label: 'You earn',
                          value: '₹1,349',
                          valueColor: const Color(0xFF22C55E),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text('Customer documents',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D0D2B))),
                  const SizedBox(height: 12),

                  // Document card
                  Container(
                    padding: const EdgeInsets.all(14),
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
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEE2E2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.description_outlined,
                              color: Color(0xFFEF4444), size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('PAN_card.pdf',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0D0D2B))),
                              Text('240 KB',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF9CA3AF))),
                            ],
                          ),
                        ),
                        const Icon(Icons.remove_red_eye_outlined,
                            color: Color(0xFF9CA3AF), size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Share meeting link
                  GestureDetector(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Meeting link copied to clipboard'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.link_rounded,
                              color: Color(0xFF4158D0), size: 18),
                          SizedBox(width: 8),
                          Text('Share meeting link',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF374151))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Start job button
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Job started · SD-48217'),
                  behavior: SnackBarBehavior.floating,
                ),
              ),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bolt, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('Start job',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14, color: Color(0xFF9CA3AF))),
          Text(value,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? const Color(0xFF0D0D2B))),
        ],
      ),
    );
  }
}
