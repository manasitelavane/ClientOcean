import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  int _tab = 0; // 0 = UPI, 1 = Card, 2 = Wallet

  final _upiCtrl = TextEditingController();
  final _cardNumCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _expiryCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();

  @override
  void dispose() {
    _upiCtrl.dispose();
    _cardNumCtrl.dispose();
    _nameCtrl.dispose();
    _expiryCtrl.dispose();
    _cvvCtrl.dispose();
    super.dispose();
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
                  const Text('Add payment method',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tab switcher
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: List.generate(3, (i) {
                    final labels = ['UPI', 'Card', 'Wallet'];
                    final icons = [
                      Icons.account_balance_wallet_outlined,
                      Icons.credit_card_rounded,
                      Icons.wallet_outlined,
                    ];
                    final active = i == _tab;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _tab = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          decoration: BoxDecoration(
                            color: active ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: active
                                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6)]
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(icons[i],
                                  size: 16,
                                  color: active ? const Color(0xFF4158D0) : const Color(0xFF9CA3AF)),
                              const SizedBox(width: 6),
                              Text(labels[i],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                                    color: active ? const Color(0xFF0D0D2B) : const Color(0xFF9CA3AF),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: _tab == 0
                    ? _UpiForm(ctrl: _upiCtrl)
                    : _tab == 1
                        ? _CardForm(
                            numCtrl: _cardNumCtrl,
                            nameCtrl: _nameCtrl,
                            expiryCtrl: _expiryCtrl,
                            cvvCtrl: _cvvCtrl,
                          )
                        : const _WalletForm(),
              ),
            ),

            // Save button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text('Save & continue',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
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

// UPI tab
class _UpiForm extends StatelessWidget {
  final TextEditingController ctrl;
  const _UpiForm({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label('UPI ID'),
        const SizedBox(height: 6),
        _Field(
          controller: ctrl,
          hint: 'yourname@upi',
          keyboard: TextInputType.emailAddress,
          suffix: const Text('Verify',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
        ),
        const SizedBox(height: 12),
        const Text('Enter your UPI ID linked to any bank account.',
            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
        const SizedBox(height: 20),
        const _Label('Supported apps'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _AppChip(label: 'GPay'),
            _AppChip(label: 'PhonePe'),
            _AppChip(label: 'Paytm'),
            _AppChip(label: 'BHIM'),
            _AppChip(label: 'Amazon Pay'),
          ],
        ),
      ],
    );
  }
}

// Card tab
class _CardForm extends StatelessWidget {
  final TextEditingController numCtrl, nameCtrl, expiryCtrl, cvvCtrl;
  const _CardForm({
    required this.numCtrl,
    required this.nameCtrl,
    required this.expiryCtrl,
    required this.cvvCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label('Card number'),
        const SizedBox(height: 6),
        _Field(
          controller: numCtrl,
          hint: '0000  0000  0000  0000',
          keyboard: TextInputType.number,
          prefix: const Icon(Icons.credit_card_rounded, color: Color(0xFF9CA3AF), size: 18),
        ),
        const SizedBox(height: 14),
        _Label('Cardholder name'),
        const SizedBox(height: 6),
        _Field(controller: nameCtrl, hint: 'Name as on card'),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Label('Expiry'),
                  const SizedBox(height: 6),
                  _Field(
                    controller: expiryCtrl,
                    hint: 'MM / YY',
                    keyboard: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Label('CVV'),
                  const SizedBox(height: 6),
                  _Field(
                    controller: cvvCtrl,
                    hint: '•••',
                    keyboard: TextInputType.number,
                    obscure: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFE0E7FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(Icons.lock_outlined, size: 14, color: Color(0xFF4158D0)),
              SizedBox(width: 8),
              Expanded(
                child: Text('Your card info is encrypted. We never store your CVV.',
                    style: TextStyle(fontSize: 12, color: Color(0xFF4158D0))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Wallet tab
class _WalletForm extends StatelessWidget {
  const _WalletForm();

  @override
  Widget build(BuildContext context) {
    final wallets = [
      {'name': 'Paytm', 'color': const Color(0xFF00BAF2)},
      {'name': 'PhonePe', 'color': const Color(0xFF5F259F)},
      {'name': 'Amazon Pay', 'color': const Color(0xFFFF9900)},
      {'name': 'MobiKwik', 'color': const Color(0xFF2BBDD3)},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('Select wallet'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
          ),
          child: Column(
            children: List.generate(wallets.length, (i) {
              final w = wallets[i];
              final isLast = i == wallets.length - 1;
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: (w['color'] as Color).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          (w['name'] as String)[0],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: w['color'] as Color,
                          ),
                        ),
                      ),
                    ),
                    title: Text(w['name'] as String,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    trailing: const Icon(Icons.chevron_right, color: Color(0xFFD1D5DB)),
                    onTap: () {},
                  ),
                  if (!isLast) const Divider(height: 1, indent: 68, color: Color(0xFFF3F4F6)),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF374151)));
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboard;
  final bool obscure;
  final Widget? prefix;
  final Widget? suffix;

  const _Field({
    required this.controller,
    required this.hint,
    this.keyboard = TextInputType.text,
    this.obscure = false,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        obscureText: obscure,
        style: const TextStyle(fontSize: 14, color: Color(0xFF0D0D2B)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
          prefixIcon: prefix != null ? Padding(padding: const EdgeInsets.all(12), child: prefix) : null,
          suffix: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}

class _AppChip extends StatelessWidget {
  final String label;
  const _AppChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
      ),
      child: Text(label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF374151))),
    );
  }
}
