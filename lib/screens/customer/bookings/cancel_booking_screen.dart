import 'package:flutter/material.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  int _selectedReason = -1;
  final _otherCtrl = TextEditingController();

  final List<String> _reasons = [
    'Schedule conflict — I need to reschedule',
    'Found another expert',
    'Service no longer needed',
    'Expert took too long to confirm',
    'Accidental booking',
    'Other',
  ];

  @override
  void dispose() {
    _otherCtrl.dispose();
    super.dispose();
  }

  void _confirm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Cancel booking?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
        content: const Text(
          'This action cannot be undone. A refund (if applicable) will be processed in 5–7 business days.',
          style: TextStyle(fontSize: 14, color: Color(0xFF6B7280), height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Keep booking',
                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, true);
            },
            child: const Text('Yes, cancel',
                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
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
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cancel booking',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                      Text('SD-48217',
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
                    // Refund notice
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3C7),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.access_time_rounded, color: Color(0xFFD97706), size: 18),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Free cancellation up to 24 hours before your appointment.',
                              style: TextStyle(fontSize: 13, color: Color(0xFF92400E), height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text('Why are you cancelling?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 4),
                    const Text('Your feedback helps us improve.',
                        style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),

                    const SizedBox(height: 14),

                    // Reasons list
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Column(
                        children: List.generate(_reasons.length, (i) {
                          final isLast = i == _reasons.length - 1;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => setState(() => _selectedReason = i),
                                child: Container(
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(_reasons[i],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: _selectedReason == i
                                                  ? const Color(0xFF0D0D2B)
                                                  : const Color(0xFF4B5563),
                                              fontWeight: _selectedReason == i
                                                  ? FontWeight.w600
                                                  : FontWeight.w400,
                                            )),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: _selectedReason == i
                                                ? const Color(0xFF4158D0)
                                                : const Color(0xFFD1D5DB),
                                            width: 2,
                                          ),
                                          color: _selectedReason == i
                                              ? const Color(0xFF4158D0)
                                              : Colors.transparent,
                                        ),
                                        child: _selectedReason == i
                                            ? const Icon(Icons.check, color: Colors.white, size: 12)
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (!isLast)
                                const Divider(height: 1, indent: 16, color: Color(0xFFF3F4F6)),
                            ],
                          );
                        }),
                      ),
                    ),

                    // Other text field
                    if (_selectedReason == _reasons.length - 1) ...[
                      const SizedBox(height: 14),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                        ),
                        child: TextField(
                          controller: _otherCtrl,
                          maxLines: 3,
                          style: const TextStyle(fontSize: 14, color: Color(0xFF0D0D2B)),
                          decoration: const InputDecoration(
                            hintText: 'Please describe your reason...',
                            hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                        ),
                        child: const Center(
                          child: Text('Keep booking',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectedReason >= 0 ? _confirm : null,
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: _selectedReason >= 0
                              ? const Color(0xFFEF4444)
                              : const Color(0xFFE5E7EB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text('Cancel booking',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: _selectedReason >= 0
                                    ? Colors.white
                                    : const Color(0xFF9CA3AF),
                              )),
                        ),
                      ),
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
