import 'package:flutter/material.dart';
import 'payment_screen.dart';

class ConfirmBookingScreen extends StatelessWidget {
  const ConfirmBookingScreen({super.key});

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
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Confirm booking',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                      Text('Step 3 of 3',
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
                  children: [
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
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text('RK',
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Rahul Kapoor',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                                Text('Chartered Accountant',
                                    style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
                              ],
                            ),
                          ),
                          const Icon(Icons.verified, color: Color(0xFF4158D0), size: 22),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Booking details
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Column(
                        children: const [
                          _DetailRow(label: 'Service', value: 'Income Tax Filing', bold: true),
                          Divider(height: 20, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Date', value: 'Tue 18 Jun', bold: true),
                          Divider(height: 20, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Time', value: '11:00 AM', bold: true),
                          Divider(height: 20, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Mode', value: 'Online', bold: true),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Fee breakdown
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Column(
                        children: const [
                          _DetailRow(label: 'Service fee', value: '₹1,499', bold: false),
                          SizedBox(height: 12),
                          _DetailRow(label: 'Platform fee', value: '₹49', bold: false),
                          SizedBox(height: 12),
                          _DetailRow(label: 'GST (18%)', value: '₹270', bold: false),
                          Divider(height: 24, color: Color(0xFFF3F4F6)),
                          _DetailRow(label: 'Total payable', value: '₹1,818', bold: true),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: const [
                        Icon(Icons.bolt_rounded, color: Color(0xFF9CA3AF), size: 16),
                        SizedBox(width: 6),
                        Text('Have a coupon? Apply it on the next step.',
                            style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF))),
                      ],
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
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const PaymentScreen()),
            ),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('Proceed to payment  →',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label, value;
  final bool bold;
  const _DetailRow({required this.label, required this.value, required this.bold});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
        Text(value,
            style: TextStyle(
                fontSize: 14,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
                color: const Color(0xFF0D0D2B))),
      ],
    );
  }
}
