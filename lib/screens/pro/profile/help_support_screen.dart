import 'package:flutter/material.dart';

class ProHelpSupportScreen extends StatefulWidget {
  const ProHelpSupportScreen({super.key});

  @override
  State<ProHelpSupportScreen> createState() => _ProHelpSupportScreenState();
}

class _ProHelpSupportScreenState extends State<ProHelpSupportScreen> {
  int _expandedIndex = -1;

  final List<Map<String, String>> _faqs = [
    {
      'q': 'How and when do I get paid?',
      'a':
          'Payouts are processed within 2–3 business days after a booking is marked complete. Funds are sent to your default payout account.',
    },
    {
      'q': 'What commission does ServeDesk take?',
      'a':
          'ServeDesk charges a platform fee of 15% on each completed booking. You keep 85% of your listed price.',
    },
    {
      'q': 'Can I set my own prices?',
      'a':
          'Yes! You can set your own price for each service you offer. Go to My services to update your pricing anytime.',
    },
    {
      'q': 'How do I decline a request?',
      'a':
          'Open the request card and tap Decline. You can optionally provide a reason. Declined requests do not affect your rating.',
    },
    {
      'q': "What if a customer doesn't show up?",
      'a':
          "If the customer is more than 15 minutes late for an online session, you can mark it as a no-show and you'll be paid in full.",
    },
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
                  const Text('Help & support',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D0D2B))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero banner
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF312E81), Color(0xFF4158D0)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Partner support',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.white
                                            .withValues(alpha: 0.2),
                                        borderRadius:
                                            BorderRadius.circular(6),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.grid_view_rounded,
                                              size: 10,
                                              color: Colors.white),
                                          SizedBox(width: 4),
                                          Text('pro-support',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight:
                                                      FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text('for experts',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Contact buttons
                    Row(
                      children: [
                        _ContactBtn(
                            icon: Icons.chat_bubble_outline_rounded,
                            label: 'Live\nchat',
                            onTap: () {}),
                        const SizedBox(width: 12),
                        _ContactBtn(
                            icon: Icons.phone_outlined,
                            label: 'Call\nus',
                            onTap: () {}),
                        const SizedBox(width: 12),
                        _ContactBtn(
                            icon: Icons.mail_outline_rounded,
                            label: 'Email',
                            onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 24),

                    const Text('For experts',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8)
                        ],
                      ),
                      child: Column(
                        children: List.generate(_faqs.length, (i) {
                          final expanded = _expandedIndex == i;
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => setState(() =>
                                    _expandedIndex = expanded ? -1 : i),
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
                                                fontWeight: expanded
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                                color:
                                                    const Color(0xFF0D0D2B))),
                                      ),
                                      Icon(
                                        expanded
                                            ? Icons
                                                .keyboard_arrow_up_rounded
                                            : Icons.chevron_right,
                                        color: const Color(0xFF9CA3AF),
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (expanded)
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16, 0, 16, 14),
                                  child: Text(_faqs[i]['a']!,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF6B7280),
                                          height: 1.5)),
                                ),
                              if (i < _faqs.length - 1)
                                const Divider(
                                    height: 1,
                                    color: Color(0xFFF3F4F6)),
                            ],
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text('ServeDesk v1.0.0 · partner@servedesk.in',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xFF9CA3AF))),
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

class _ContactBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactBtn(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8)
            ],
          ),
          child: Column(
            children: [
              Icon(icon, color: const Color(0xFF4158D0), size: 22),
              const SizedBox(height: 6),
              Text(label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151),
                      height: 1.2)),
            ],
          ),
        ),
      ),
    );
  }
}
