import 'package:flutter/material.dart';
import 'add_payment_method_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  final List<_PaymentItem> _items = [
    _PaymentItem(
      type: 'card',
      title: 'HDFC Bank ···· 4821',
      subtitle: 'Expires 09/27',
      icon: Icons.credit_card_rounded,
      iconColor: const Color(0xFF4158D0),
      iconBg: const Color(0xFFE0E7FF),
      isDefault: true,
    ),
    _PaymentItem(
      type: 'upi',
      title: 'priya@okaxis',
      subtitle: 'UPI · Axis Bank',
      icon: Icons.account_balance_wallet_outlined,
      iconColor: const Color(0xFF059669),
      iconBg: const Color(0xFFD1FAE5),
      isDefault: false,
    ),
  ];

  void _showOptions(BuildContext context, _PaymentItem item) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(width: 40, height: 4, decoration: BoxDecoration(color: const Color(0xFFE5E7EB), borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 16),
            if (!item.isDefault)
              ListTile(
                leading: const Icon(Icons.check_circle_outline, color: Color(0xFF4158D0)),
                title: const Text('Set as default',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    for (final e in _items) {
                      e.isDefault = e == item;
                    }
                  });
                },
              ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
              title: const Text('Remove',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFFEF4444))),
              onTap: () {
                Navigator.pop(context);
                setState(() => _items.remove(item));
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
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
                  const Text('Payment methods',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    // Cards
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Column(
                        children: List.generate(_items.length, (i) {
                          final item = _items[i];
                          final isLast = i == _items.length - 1;
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
                                        color: item.iconBg,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(item.icon, color: item.iconColor, size: 20),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(item.title,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                      color: Color(0xFF0D0D2B))),
                                              if (item.isDefault) ...[
                                                const SizedBox(width: 8),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFD1FAE5),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: const Text('Default',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(0xFF059669))),
                                                ),
                                              ],
                                            ],
                                          ),
                                          Text(item.subtitle,
                                              style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _showOptions(context, item),
                                      child: const Icon(Icons.more_horiz, color: Color(0xFF9CA3AF)),
                                    ),
                                  ],
                                ),
                              ),
                              if (!isLast)
                                const Divider(height: 1, indent: 68, color: Color(0xFFF3F4F6)),
                            ],
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Security notice
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shield_outlined, size: 16, color: Color(0xFF4158D0)),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Payments are encrypted and processed securely. ServeDesk never stores your CVV.',
                              style: TextStyle(fontSize: 12, color: Color(0xFF4158D0), height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AddPaymentMethodScreen()),
                ),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF4158D0)),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xFF4158D0), size: 20),
                        SizedBox(width: 8),
                        Text('Add payment method',
                            style: TextStyle(
                                color: Color(0xFF4158D0),
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
      ),
    );
  }
}

class _PaymentItem {
  final String type, title, subtitle;
  final IconData icon;
  final Color iconColor, iconBg;
  bool isDefault;

  _PaymentItem({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.isDefault,
  });
}
