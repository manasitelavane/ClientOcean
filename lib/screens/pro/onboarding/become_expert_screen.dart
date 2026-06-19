import 'package:flutter/material.dart';
import 'verification_pending_screen.dart';

class BecomeExpertScreen extends StatefulWidget {
  const BecomeExpertScreen({super.key});

  @override
  State<BecomeExpertScreen> createState() => _BecomeExpertScreenState();
}

class _BecomeExpertScreenState extends State<BecomeExpertScreen> {
  int _step = 0;

  final _nameCtrl = TextEditingController(text: 'Rahul Kapoor');
  final _emailCtrl = TextEditingController(text: 'rahul.k@email.com');
  final _cityCtrl = TextEditingController(text: 'Mumbai');
  final _expCtrl = TextEditingController(text: '11');

  String? _selectedCategory;
  final List<String> _categories = [
    'Chartered Accountant',
    'Lawyer',
    'Doctor',
    'Financial Advisor',
    'Consultant',
  ];

  void _next() {
    if (_step < 2) {
      setState(() => _step++);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const VerificationPendingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F4FF),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (_step > 0) {
              setState(() => _step--);
            } else {
              Navigator.pop(context);
            }
          },
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Become an expert',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0D0D2B))),
            Text('Step ${_step + 1} of 3',
                style: const TextStyle(
                    fontSize: 12, color: Color(0xFF9CA3AF))),
          ],
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (_step + 1) / 3,
                backgroundColor: const Color(0xFFE5E7EB),
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF4158D0)),
                minHeight: 4,
              ),
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildStep(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: GestureDetector(
              onTap: _next,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _step < 2 ? 'Continue' : 'Submit application',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward,
                        color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep() {
    switch (_step) {
      case 0:
        return _Step1(
            nameCtrl: _nameCtrl,
            emailCtrl: _emailCtrl,
            cityCtrl: _cityCtrl,
            expCtrl: _expCtrl);
      case 1:
        return _Step2(
            categories: _categories,
            selected: _selectedCategory,
            onSelect: (v) => setState(() => _selectedCategory = v));
      default:
        return const _Step3();
    }
  }
}

class _Step1 extends StatelessWidget {
  final TextEditingController nameCtrl, emailCtrl, cityCtrl, expCtrl;
  const _Step1({
    required this.nameCtrl,
    required this.emailCtrl,
    required this.cityCtrl,
    required this.expCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tell us about you',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D0D2B))),
        const SizedBox(height: 24),
        _Field(label: 'Full name', ctrl: nameCtrl,
            icon: Icons.person_outline),
        const SizedBox(height: 16),
        _Field(label: 'Email', ctrl: emailCtrl,
            icon: Icons.chat_bubble_outline, keyboard: TextInputType.emailAddress),
        const SizedBox(height: 16),
        _Field(label: 'City', ctrl: cityCtrl,
            icon: Icons.location_on_outlined),
        const SizedBox(height: 16),
        _Field(label: 'Years of experience', ctrl: expCtrl,
            icon: Icons.workspace_premium_outlined,
            keyboard: TextInputType.number),
      ],
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  final IconData icon;
  final TextInputType keyboard;

  const _Field({
    required this.label,
    required this.ctrl,
    required this.icon,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0D0D2B))),
        const SizedBox(height: 8),
        Container(
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
          child: TextField(
            controller: ctrl,
            keyboardType: keyboard,
            style: const TextStyle(
                fontSize: 15, color: Color(0xFF0D0D2B)),
            decoration: InputDecoration(
              prefixIcon:
                  Icon(icon, size: 18, color: const Color(0xFF9CA3AF)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class _Step2 extends StatelessWidget {
  final List<String> categories;
  final String? selected;
  final ValueChanged<String> onSelect;

  const _Step2({
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Choose your category',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D0D2B))),
        const SizedBox(height: 8),
        const Text('Select the primary service category you offer.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
        const SizedBox(height: 24),
        ...categories.map((c) => GestureDetector(
              onTap: () => onSelect(c),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: selected == c
                        ? const Color(0xFF4158D0)
                        : const Color(0xFFE5E7EB),
                    width: selected == c ? 2 : 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(c,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: selected == c
                                  ? const Color(0xFF4158D0)
                                  : const Color(0xFF0D0D2B))),
                    ),
                    if (selected == c)
                      const Icon(Icons.check_circle,
                          color: Color(0xFF4158D0), size: 20),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class _Step3 extends StatelessWidget {
  const _Step3();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upload documents',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D0D2B))),
        const SizedBox(height: 8),
        const Text(
            'Upload your qualification certificates and ID proof.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
        const SizedBox(height: 24),
        _UploadTile(label: 'Degree / Certificate'),
        const SizedBox(height: 12),
        _UploadTile(label: 'Professional License'),
        const SizedBox(height: 12),
        _UploadTile(label: 'ID Proof (Aadhaar / PAN)'),
      ],
    );
  }
}

class _UploadTile extends StatelessWidget {
  final String label;
  const _UploadTile({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: const Color(0xFFE5E7EB),
            style: BorderStyle.solid,
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.upload_file_outlined,
                color: Color(0xFF4158D0), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF374151))),
          ),
          const Icon(Icons.add_circle_outline,
              color: Color(0xFF4158D0), size: 22),
        ],
      ),
    );
  }
}
