import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'my_services_screen.dart';
import 'availability_screen.dart';
import 'my_reviews_screen.dart';
import '../earnings/payout_settings_screen.dart';
import 'help_support_screen.dart';
import '../../onboarding/onboarding_screen.dart';
import '../../customer/customer_shell.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        width: 72,
                        height: 72,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'RK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Rahul Kapoor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0D0D2B),
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.verified,
                              color: Color(0xFF4158D0), size: 20),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Chartered Accountant',
                        style: TextStyle(
                            fontSize: 14, color: Color(0xFF6B7280)),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Badge(
                            icon: Icons.star_rounded,
                            label: '4.9',
                            color: const Color(0xFFF59E0B),
                            bg: const Color(0xFFFEF3C7),
                          ),
                          const SizedBox(width: 8),
                          _Badge(
                            icon: Icons.circle,
                            label: 'Verified',
                            color: const Color(0xFF22C55E),
                            bg: const Color(0xFFDCFCE7),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Menu section 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.person_outline,
                        label: 'Edit profile',
                        subtitle: 'Bio, photo, languages',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const ProEditProfileScreen()),
                        ),
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.work_outline,
                        label: 'My services',
                        subtitle: '3 active',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const MyServicesScreen()),
                        ),
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.calendar_month_outlined,
                        label: 'Availability',
                        subtitle: 'Mon-Fri, 9-6',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const AvailabilityScreen()),
                        ),
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.star_border_rounded,
                        label: 'My reviews',
                        subtitle: '4.9 · 312 reviews',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const MyReviewsScreen()),
                        ),
                        showDivider: true,
                      ),
                      _MenuItem(
                        icon: Icons.account_balance_wallet_outlined,
                        label: 'Payout settings',
                        subtitle: 'HDFC ••4821',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const PayoutSettingsScreen()),
                        ),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.shield_outlined,
                        label: 'Verification',
                        subtitle: 'Verified expert',
                        onTap: () {},
                        showDivider: true,
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Verified',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF22C55E))),
                        ),
                      ),
                      _MenuItem(
                        icon: Icons.chat_bubble_outline,
                        label: 'Help & support',
                        subtitle: '',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const ProHelpSupportScreen()),
                        ),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _MenuCard(
                    children: [
                      _MenuItem(
                        icon: Icons.person_pin_outlined,
                        label: 'Switch to customer',
                        subtitle: 'Book services yourself',
                        onTap: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const CustomerShell()),
                          (_) => false,
                        ),
                        showDivider: false,
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
                          MaterialPageRoute(
                              builder: (_) => const OnboardingScreen()),
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

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color, bg;

  const _Badge({
    required this.icon,
    required this.label,
    required this.color,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: color)),
        ],
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
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
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
                  child: Icon(icon,
                      size: 18,
                      color: iconColor ?? const Color(0xFF4158D0)),
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
                              color:
                                  labelColor ?? const Color(0xFF0D0D2B))),
                      if (subtitle.isNotEmpty)
                        Text(subtitle,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xFF9CA3AF))),
                    ],
                  ),
                ),
                trailing ??
                    const Icon(Icons.chevron_right,
                        color: Color(0xFFD1D5DB)),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
              height: 1, indent: 66, color: Color(0xFFF3F4F6)),
      ],
    );
  }
}
