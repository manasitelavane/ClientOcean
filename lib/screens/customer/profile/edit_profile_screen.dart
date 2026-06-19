import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
                  const Text('Edit profile',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
                child: Column(
                  children: [
                    // Avatar with camera
                    Stack(
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF4338CA)]),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text('PS',
                                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 6)],
                            ),
                            child: const Icon(Icons.camera_alt_rounded, size: 15, color: Color(0xFF4158D0)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    _FieldLabel(label: 'Full name'),
                    const SizedBox(height: 8),
                    _InputField(
                      icon: Icons.person_outline,
                      hintText: 'Priya Sharma',
                      initialValue: 'Priya Sharma',
                    ),

                    const SizedBox(height: 20),

                    _FieldLabel(label: 'Email'),
                    const SizedBox(height: 8),
                    _InputField(
                      icon: Icons.chat_bubble_outline_rounded,
                      hintText: 'priya.sharma@email.com',
                      initialValue: 'priya.sharma@email.com',
                    ),

                    const SizedBox(height: 20),

                    _FieldLabel(label: 'Phone'),
                    const SizedBox(height: 8),
                    _InputField(
                      icon: Icons.phone_outlined,
                      hintText: '+91 98765 43210',
                      initialValue: '+91 98765 43210',
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
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('Save changes',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
    );
  }
}

class _InputField extends StatelessWidget {
  final IconData icon;
  final String hintText, initialValue;
  const _InputField({required this.icon, required this.hintText, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
      ),
      child: TextFormField(
        initialValue: initialValue,
        style: const TextStyle(fontSize: 15, color: Color(0xFF0D0D2B)),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF9CA3AF), size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
        ),
      ),
    );
  }
}
