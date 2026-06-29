import 'package:flutter/material.dart';

class PayoutSettingsScreen extends StatefulWidget {
  const PayoutSettingsScreen({super.key});

  @override
  State<PayoutSettingsScreen> createState() => _PayoutSettingsScreenState();
}

class _PayoutAccount {
  final String title, subtitle;
  final IconData icon;
  bool isDefault;

  _PayoutAccount({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isDefault,
  });
}

class _PayoutSettingsScreenState extends State<PayoutSettingsScreen> {
  final List<_PayoutAccount> _accounts = [
    _PayoutAccount(
      title: 'HDFC Bank ···· 4821',
      subtitle: 'Rahul Kapoor',
      icon: Icons.credit_card_rounded,
      isDefault: true,
    ),
    _PayoutAccount(
      title: 'rahul@okhdfc',
      subtitle: 'UPI · HDFC Bank',
      icon: Icons.currency_rupee_rounded,
      isDefault: false,
    ),
  ];

  void _showOptions(int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(2)),
            ),
            const SizedBox(height: 8),
            if (!_accounts[index].isDefault)
              ListTile(
                leading: const Icon(Icons.check_circle_outline,
                    color: Color(0xFF4158D0)),
                title: const Text('Set as default'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    for (final a in _accounts) {
                      a.isDefault = false;
                    }
                    _accounts[index].isDefault = true;
                  });
                },
              ),
            ListTile(
              leading:
                  const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
              title: const Text('Remove account',
                  style: TextStyle(color: Color(0xFFEF4444))),
              onTap: () {
                Navigator.pop(context);
                setState(() => _accounts.removeAt(index));
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
                  const Text('Payout settings',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D0D2B))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Manage where your earnings are deposited. Payouts go to your default account.',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                          height: 1.4),
                    ),
                    const SizedBox(height: 16),
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
                        children: List.generate(_accounts.length, (i) {
                          final acc = _accounts[i];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEEF0FA),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      child: Icon(acc.icon,
                                          color: const Color(0xFF4158D0),
                                          size: 20),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(acc.title,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Color(0xFF0D0D2B))),
                                              if (acc.isDefault) ...[
                                                const SizedBox(width: 8),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 7,
                                                          vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: const Color(
                                                        0xFFDCFCE7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: const Text('Default',
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xFF22C55E))),
                                                ),
                                              ],
                                            ],
                                          ),
                                          const SizedBox(height: 2),
                                          if (!acc.isDefault)
                                            GestureDetector(
                                              onTap: () => setState(() {
                                                for (final a in _accounts) {
                                                  a.isDefault = false;
                                                }
                                                acc.isDefault = true;
                                              }),
                                              child: Row(
                                                children: [
                                                  Text(acc.subtitle,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xFF6B7280))),
                                                  const SizedBox(width: 10),
                                                  const Text('Set as default',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xFF4158D0))),
                                                ],
                                              ),
                                            )
                                          else
                                            Text(acc.subtitle,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        Color(0xFF6B7280))),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _showOptions(i),
                                      child: const Icon(Icons.more_horiz,
                                          color: Color(0xFF9CA3AF)),
                                    ),
                                  ],
                                ),
                              ),
                              if (i < _accounts.length - 1)
                                const Divider(
                                    height: 1,
                                    indent: 68,
                                    color: Color(0xFFF3F4F6)),
                            ],
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF0FA),
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: const Color(0xFFE0E7FF)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shield_outlined,
                              color: Color(0xFF4158D0), size: 18),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Account details are encrypted and used only for payouts.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                  height: 1.4),
                            ),
                          ),
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
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8)
                ],
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_rounded,
                        color: Color(0xFF374151), size: 20),
                    SizedBox(width: 8),
                    Text('Add payout account',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF374151))),
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
