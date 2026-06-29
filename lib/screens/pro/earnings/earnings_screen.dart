import 'package:flutter/material.dart';
import 'payout_screen.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: const Text('Earnings',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0D0D2B))),
              ),

              // Balance card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Available balance',
                          style: TextStyle(
                              fontSize: 14, color: Colors.white70)),
                      const SizedBox(height: 8),
                      const Text('₹32,400',
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const PayoutScreen()),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D0D2B),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Colors.white,
                                  size: 18),
                              SizedBox(width: 8),
                              Text('Request payout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Stats row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                          label: 'This month', value: '₹86,400'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                          label: 'Total earned', value: '₹7,42,300'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Transactions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Transactions',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D0D2B))),
                    GestureDetector(
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Export coming soon'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      ),
                      child: const Text('Export',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4158D0))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
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
                    children: const [
                      _TxItem(
                        icon: Icons.trending_up_rounded,
                        iconBg: Color(0xFFDCFCE7),
                        iconColor: Color(0xFF22C55E),
                        title: 'Income Tax Filing',
                        subtitle: 'SD-47882 · 03 Jun',
                        amount: '+₹2,699',
                        amountColor: Color(0xFF22C55E),
                        isLast: false,
                      ),
                      _TxItem(
                        icon: Icons.account_balance_wallet_outlined,
                        iconBg: Color(0xFFFEE2E2),
                        iconColor: Color(0xFFEF4444),
                        title: 'Payout to HDFC ••4821',
                        subtitle: '01 Jun',
                        amount: '–₹18,500',
                        amountColor: Color(0xFFEF4444),
                        isLast: false,
                      ),
                      _TxItem(
                        icon: Icons.trending_up_rounded,
                        iconBg: Color(0xFFDCFCE7),
                        iconColor: Color(0xFF22C55E),
                        title: 'Tax Consultation',
                        subtitle: 'SD-47710 · 28 May',
                        amount: '+₹720',
                        amountColor: Color(0xFF22C55E),
                        isLast: false,
                      ),
                      _TxItem(
                        icon: Icons.trending_up_rounded,
                        iconBg: Color(0xFFDCFCE7),
                        iconColor: Color(0xFF22C55E),
                        title: 'GST Registration',
                        subtitle: 'SD-47650 · 25 May',
                        amount: '+₹2,699',
                        amountColor: Color(0xFF22C55E),
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12, color: Color(0xFF9CA3AF))),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0D0D2B))),
        ],
      ),
    );
  }
}

class _TxItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg, iconColor;
  final String title, subtitle, amount;
  final Color amountColor;
  final bool isLast;

  const _TxItem({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: iconBg, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF9CA3AF))),
                  ],
                ),
              ),
              Text(amount,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: amountColor)),
            ],
          ),
        ),
        if (!isLast)
          const Divider(
              height: 1, indent: 68, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}
