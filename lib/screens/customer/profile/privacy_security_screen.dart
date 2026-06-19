import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometric = true;
  bool _twoFactor = false;
  bool _showProfile = true;
  bool _activityStatus = false;
  bool _marketing = true;

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete account?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
        content: const Text(
          'All your data, bookings, and profile will be permanently removed. This cannot be undone.',
          style: TextStyle(fontSize: 14, color: Color(0xFF6B7280), height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF6B7280))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Delete',
                style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFEF4444))),
          ),
        ],
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
                  const Text('Privacy & security',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Security section
                    _SectionLabel(label: 'SECURITY'),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _ToggleRow(
                          icon: Icons.fingerprint_rounded,
                          iconBg: const Color(0xFFE0E7FF),
                          iconColor: const Color(0xFF4158D0),
                          label: 'Biometric unlock',
                          subtitle: 'Use Face ID to open the app',
                          value: _biometric,
                          onChanged: (v) => setState(() => _biometric = v),
                          showDivider: true,
                        ),
                        _ToggleRow(
                          icon: Icons.check_circle_outline_rounded,
                          iconBg: const Color(0xFFE0E7FF),
                          iconColor: const Color(0xFF4158D0),
                          label: 'Two-factor authentication',
                          subtitle: 'Extra OTP at every login',
                          value: _twoFactor,
                          onChanged: (v) => setState(() => _twoFactor = v),
                          showDivider: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Privacy section
                    _SectionLabel(label: 'PRIVACY'),
                    const SizedBox(height: 8),
                    _ToggleCard(
                      children: [
                        _ToggleRow(
                          icon: Icons.person_outline,
                          iconBg: const Color(0xFFE0E7FF),
                          iconColor: const Color(0xFF4158D0),
                          label: 'Show profile to experts',
                          subtitle: 'Experts can see your name & photo',
                          value: _showProfile,
                          onChanged: (v) => setState(() => _showProfile = v),
                          showDivider: true,
                        ),
                        _ToggleRow(
                          icon: Icons.remove_red_eye_outlined,
                          iconBg: const Color(0xFFE0E7FF),
                          iconColor: const Color(0xFF4158D0),
                          label: 'Activity status',
                          subtitle: 'Let experts see when you\'re online',
                          value: _activityStatus,
                          onChanged: (v) => setState(() => _activityStatus = v),
                          showDivider: true,
                        ),
                        _ToggleRow(
                          icon: Icons.notifications_outlined,
                          iconBg: const Color(0xFFE0E7FF),
                          iconColor: const Color(0xFF4158D0),
                          label: 'Marketing communications',
                          subtitle: 'Offers, tips and newsletters',
                          value: _marketing,
                          onChanged: (v) => setState(() => _marketing = v),
                          showDivider: false,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Data actions
                    _SectionLabel(label: 'YOUR DATA'),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Column(
                        children: [
                          _ActionRow(
                            icon: Icons.download_outlined,
                            iconBg: const Color(0xFFE0E7FF),
                            iconColor: const Color(0xFF4158D0),
                            label: 'Download my data',
                            subtitle: 'Get a copy of your account data',
                            showDivider: true,
                            onTap: () {},
                          ),
                          _ActionRow(
                            icon: Icons.delete_outline_rounded,
                            iconBg: const Color(0xFFFEE2E2),
                            iconColor: const Color(0xFFEF4444),
                            label: 'Delete account',
                            subtitle: 'Permanently remove your data',
                            labelColor: const Color(0xFFEF4444),
                            showDivider: false,
                            onTap: _confirmDelete,
                          ),
                        ],
                      ),
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

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF9CA3AF),
            letterSpacing: 0.8));
  }
}

class _ToggleCard extends StatelessWidget {
  final List<Widget> children;
  const _ToggleCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
      ),
      child: Column(children: children),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final IconData icon;
  final Color iconBg, iconColor;
  final String label, subtitle;
  final bool value, showDivider;
  final ValueChanged<bool> onChanged;

  const _ToggleRow({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, size: 18, color: iconColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                    Text(subtitle,
                        style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: const Color(0xFF4158D0),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xFFE5E7EB),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(height: 1, indent: 66, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final Color iconBg, iconColor;
  final String label, subtitle;
  final Color? labelColor;
  final bool showDivider;
  final VoidCallback onTap;

  const _ActionRow({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.subtitle,
    this.labelColor,
    required this.showDivider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)),
                  child: Icon(icon, size: 18, color: iconColor),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: labelColor ?? const Color(0xFF0D0D2B))),
                      Text(subtitle,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Color(0xFFD1D5DB)),
              ],
            ),
          ),
        ),
        if (showDivider) const Divider(height: 1, indent: 66, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}
