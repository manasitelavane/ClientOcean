import 'package:flutter/material.dart';
import 'booking_confirmed_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0;

  final _methods = const [
    (Icons.credit_card_rounded, 'UPI', 'Pay via any UPI app'),
    (Icons.credit_card_rounded, 'Card', 'Visa, Mastercard, Rupay'),
    (Icons.account_balance_wallet_outlined, 'Wallet', 'Paytm, PhonePe, Amazon Pay'),
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
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF0D0D2B)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text('Payment',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Amount card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFB2EBF2), Color(0xFFE0E7FF)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: const [
                          Text('Amount to pay',
                              style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                          SizedBox(height: 6),
                          Text('₹1,818',
                              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Color(0xFF0D0D2B))),
                          SizedBox(height: 4),
                          Text('Income Tax Filing · Rahul Kapoor',
                              style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Coupon
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.bolt_rounded, color: Color(0xFF9CA3AF), size: 18),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text('Coupon code',
                                style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
                          ),
                          Text('Apply',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4158D0))),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text('Payment method',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),

                    ...List.generate(_methods.length, (i) {
                      final active = i == _selectedMethod;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedMethod = i),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: active ? const Color(0xFF4158D0) : const Color(0xFFE5E7EB),
                              width: active ? 1.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: active ? const Color(0xFFE0E7FF) : const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(_methods[i].$1,
                                    color: active ? const Color(0xFF4158D0) : const Color(0xFF9CA3AF),
                                    size: 20),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_methods[i].$2,
                                        style: const TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                                    Text(_methods[i].$3,
                                        style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                                  ],
                                ),
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: active
                                      ? const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                                      : null,
                                  border: active ? null : Border.all(color: const Color(0xFFD1D5DB)),
                                  color: active ? null : Colors.white,
                                ),
                                child: active
                                    ? const Icon(Icons.check, color: Colors.white, size: 14)
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),

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
              MaterialPageRoute(builder: (_) => const BookingConfirmedScreen()),
            ),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield_outlined, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text('Pay ₹1,818 securely',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
