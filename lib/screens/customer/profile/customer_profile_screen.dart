import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'saved_addresses_screen.dart';
import '../../pro/pro_shell.dart';
import '../../onboarding/onboarding_screen.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFC8DCFF), Color(0xFFE4EEFF)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF4338CA)]),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('PS',
                              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Priya Sharma',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                            SizedBox(height: 2),
                            Text('+91 98765 43210',
                                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                          ),
                          child: const Icon(Icons.edit_outlined, color: Color(0xFF4158D0), size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Account settings
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.person_outline,
                        label: 'Edit profile',
                        subtitle: 'Name, photo, phone',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        ),
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.location_on_outlined,
                        label: 'Saved addresses',
                        subtitle: '2 addresses',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SavedAddressesScreen()),
                        ),
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.credit_card_rounded,
                        label: 'Payment methods',
                        subtitle: 'UPI, 1 card',
                        onTap: () {},
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.favorite_border_rounded,
                        label: 'Saved experts',
                        subtitle: '3 saved',
                        onTap: () {},
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.notifications_outlined,
                        label: 'Notifications',
                        subtitle: '',
                        onTap: () {},
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.shield_outlined,
                        label: 'Privacy & security',
                        subtitle: '',
                        onTap: () {},
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.chat_bubble_outline,
                        label: 'Help & support',
                        subtitle: '',
                        onTap: () {},
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.business_center_outlined,
                        label: 'Switch to professional',
                        subtitle: 'Offer services & earn',
                        onTap: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const ProShell()),
                          (_) => false,
                        ),
                        showDivider: false,
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E7FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Pro',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF4158D0))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.logout,
                        label: 'Log out',
                        subtitle: '',
                        onTap: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                          (_) => false,
                        ),
                        showDivider: false,
                        labelColor: const Color(0xFFEF4444),
                        iconBg: const Color(0xFFFEE2E2),
                        iconColor: const Color(0xFFEF4444),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final List<Widget> children;
  const _MenuCard({required this.children});

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

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label, subtitle;
  final VoidCallback onTap;
  final bool showDivider;
  final Widget? trailing;
  final Color? labelColor, iconBg, iconColor;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
    required this.showDivider,
    this.trailing,
    this.labelColor,
    this.iconBg,
    this.iconColor,
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
                  decoration: BoxDecoration(
                    color: iconBg ?? const Color(0xFFEEF0FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 18, color: iconColor ?? const Color(0xFF4158D0)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: labelColor ?? const Color(0xFF0D0D2B))),
                      if (subtitle.isNotEmpty)
                        Text(subtitle,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                    ],
                  ),
                ),
                trailing ?? const Icon(Icons.chevron_right, color: Color(0xFFD1D5DB)),
              ],
            ),
          ),
        ),
        if (showDivider) const Divider(height: 1, indent: 66, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}
