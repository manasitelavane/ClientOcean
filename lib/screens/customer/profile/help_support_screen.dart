import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  int _expandedIndex = -1;

  final List<Map<String, String>> _faqs = [
    {
      'q': 'How do I reschedule a booking?',
      'a': 'Go to My Bookings → tap on the booking → tap Reschedule. You can pick a new date and time slot. Rescheduling is free up to 24 hours before the appointment.',
    },
    {
      'q': 'When am I charged for a service?',
      'a': 'Payment is collected at the time of booking confirmation. Your card or UPI is charged immediately after you tap "Pay securely".',
    },
    {
      'q': 'What is your refund policy?',
      'a': 'Cancellations made 24+ hours before the appointment are fully refunded. Cancellations within 24 hours are charged a 10% convenience fee. Refunds are processed in 5–7 business days.',
    },
    {
      'q': 'How are experts verified?',
      'a': 'Every expert on ServeDesk goes through a 3-step verification: document check (degrees, licences), background screening, and a trial review by our team.',
    },
    {
      'q': 'Can I change the delivery mode after booking?',
      'a': 'Yes, if the expert allows it. Open Booking detail → Contact expert via chat → request a mode change. Experts typically respond within 2 hours.',
    },
    {
      'q': 'How do I report an issue with an expert?',
      'a': 'Go to Booking detail after the session → tap "Report issue". Our support team reviews all reports within 24 hours.',
    },
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
                  const Text('Help & support',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Hero banner
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 130,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF4158D0), Color(0xFF4DD0E1)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('We\'re here to help',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white)),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.circle, color: Color(0xFF4ADE80), size: 8),
                                SizedBox(width: 6),
                                Text('Average response: 5 minutes',
                                    style: TextStyle(fontSize: 12, color: Colors.white70)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Contact options
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: _ContactBtn(
                              icon: Icons.chat_bubble_outline_rounded,
                              label: 'Live chat',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _ContactBtn(
                              icon: Icons.phone_outlined,
                              label: 'Call us',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _ContactBtn(
                              icon: Icons.mail_outline_rounded,
                              label: 'Email',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // FAQ header
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Frequently asked',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D0D2B))),
                    ),
                    const SizedBox(height: 12),

                    // FAQ list
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                        ),
                        child: Column(
                          children: List.generate(_faqs.length, (i) {
                            final isExpanded = _expandedIndex == i;
                            final isLast = i == _faqs.length - 1;
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () => setState(
                                      () => _expandedIndex = isExpanded ? -1 : i),
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 14),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(_faqs[i]['q']!,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: isExpanded
                                                      ? FontWeight.w700
                                                      : FontWeight.w500,
                                                  color: isExpanded
                                                      ? const Color(0xFF4158D0)
                                                      : const Color(0xFF0D0D2B))),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          isExpanded
                                              ? Icons.keyboard_arrow_up_rounded
                                              : Icons.keyboard_arrow_down_rounded,
                                          color: isExpanded
                                              ? const Color(0xFF4158D0)
                                              : const Color(0xFF9CA3AF),
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (isExpanded)
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                                    child: Text(_faqs[i]['a']!,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF4B5563),
                                            height: 1.6)),
                                  ),
                                if (!isLast)
                                  const Divider(height: 1, indent: 16, color: Color(0xFFF3F4F6)),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Version info
                    const Center(
                      child: Text('ServeDesk v1.0.0 · support@servedesk.in',
                          style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                    ),
                    const SizedBox(height: 32),
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

class _ContactBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ContactBtn({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF0FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF4158D0), size: 20),
            ),
            const SizedBox(height: 8),
            Text(label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF374151))),
          ],
        ),
      ),
    );
  }
}
