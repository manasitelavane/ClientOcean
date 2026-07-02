import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'category_screen.dart';
import 'service_detail_screen.dart';
import '../experts/expert_profile_screen.dart';
import '../alerts/alerts_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final PageController _promoCtrl = PageController();
  int _promoPage = 0;

  @override
  void dispose() {
    _promoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient header
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
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Good morning',
                                    style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
                                SizedBox(height: 2),
                                Text('Priya Sharma',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF0D0D2B))),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const AlertsScreen()),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.06),
                                          blurRadius: 8)
                                    ],
                                  ),
                                  child: const Icon(Icons.notifications_outlined,
                                      color: Color(0xFF4158D0), size: 22),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFEF4444), shape: BoxShape.circle),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SearchScreen()),
                        ),
                        child: Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 8)
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text('Search services or experts...',
                                    style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
                              ),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.tune_rounded,
                                    color: Colors.white, size: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Promotional slider
            SizedBox(
              height: 130,
              child: PageView(
                controller: _promoCtrl,
                onPageChanged: (p) => setState(() => _promoPage = p),
                children: const [
                  _PromoCard(
                    gradient: [Color(0xFF4158D0), Color(0xFF0652DD)],
                    tag: 'Limited offer',
                    title: '₹499 off your first booking',
                    subtitle: 'Use code FIRST499 at checkout',
                    icon: Icons.local_offer_rounded,
                  ),
                  _PromoCard(
                    gradient: [Color(0xFF059669), Color(0xFF047857)],
                    tag: 'New service',
                    title: 'Legal consultation from ₹799',
                    subtitle: 'Connect with top lawyers instantly',
                    icon: Icons.shield_outlined,
                  ),
                  _PromoCard(
                    gradient: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
                    tag: 'Top rated',
                    title: 'GST filing made easy',
                    subtitle: '1,200+ businesses trust our CAs',
                    icon: Icons.trending_up_rounded,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: _promoPage == i ? 18 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _promoPage == i
                        ? const Color(0xFF4158D0)
                        : const Color(0xFFD1D5DB),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // Categories
            _SectionRow(
              title: 'Categories',
              onSeeAll: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
                children: [
                  _CategoryCard(
                    label: 'Finance & Tax',
                    icon: Icons.trending_up_rounded,
                    iconColor: const Color(0xFF059669),
                    bgColor: const Color(0xFFD1FAE5),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CategoryScreen(category: 'Finance & Tax')),
                    ),
                  ),
                  _CategoryCard(
                    label: 'Legal',
                    icon: Icons.shield_outlined,
                    iconColor: const Color(0xFF4158D0),
                    bgColor: const Color(0xFFE0E7FF),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CategoryScreen(category: 'Legal')),
                    ),
                  ),
                  _CategoryCard(
                    label: 'Health',
                    icon: Icons.favorite_border_rounded,
                    iconColor: const Color(0xFFEF4444),
                    bgColor: const Color(0xFFFEE2E2),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CategoryScreen(category: 'Health')),
                    ),
                  ),
                  _CategoryCard(
                    label: 'Tech & IT',
                    icon: Icons.bolt_rounded,
                    iconColor: const Color(0xFF7C3AED),
                    bgColor: const Color(0xFFEDE9FE),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CategoryScreen(category: 'Tech & IT')),
                    ),
                  ),
                  _CategoryCard(
                    label: 'Design',
                    icon: Icons.edit_outlined,
                    iconColor: const Color(0xFF16A34A),
                    bgColor: const Color(0xFFDCFCE7),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CategoryScreen(category: 'Design')),
                    ),
                  ),
                  _CategoryCard(
                    label: 'Business',
                    icon: Icons.business_center_outlined,
                    iconColor: const Color(0xFFD97706),
                    bgColor: const Color(0xFFFEF3C7),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CategoryScreen(category: 'Business')),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Featured experts
            _SectionRow(
              title: 'Featured experts',
              onSeeAll: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _ExpertCard(
                    initials: 'RK',
                    name: 'Rahul Kapoor',
                    title: 'Chartered Accountant',
                    rating: '4.9',
                    reviews: '312',
                    isOnline: true,
                    avatarColors: const [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ExpertProfileScreen()),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _ExpertCard(
                    initials: 'SI',
                    name: 'Sneha Iyer',
                    title: 'Tax Consultant',
                    rating: '4.8',
                    reviews: '198',
                    isOnline: false,
                    avatarColors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ExpertProfileScreen()),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Popular services
            _SectionRow(
              title: 'Popular services',
              onSeeAll: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _ServiceRow(
                icon: Icons.trending_up_rounded,
                iconColor: const Color(0xFF059669),
                iconBg: const Color(0xFFD1FAE5),
                name: 'Income Tax Filing',
                subtitle: '1,240 booked · Finance & Tax',
                price: '₹1,499',
                priceLabel: 'starting',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ServiceDetailScreen()),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SectionRow extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;
  const _SectionRow({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text('See all',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor, bgColor;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(height: 8),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
          ],
        ),
      ),
    );
  }
}

class _ExpertCard extends StatelessWidget {
  final String initials, name, title, rating, reviews;
  final bool isOnline;
  final List<Color> avatarColors;
  final VoidCallback onTap;

  const _ExpertCard({
    required this.initials,
    required this.name,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.isOnline,
    required this.avatarColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: avatarColors),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(initials,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0D0D2B))),
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.verified, color: Color(0xFF4158D0), size: 13),
                        ],
                      ),
                      Text(title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 14),
                const SizedBox(width: 3),
                Text('$rating ($reviews)',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151))),
                if (isOnline) ...[
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                        color: const Color(0xFFDCFCE7),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.circle, color: Color(0xFF22C55E), size: 6),
                        SizedBox(width: 4),
                        Text('Online',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF22C55E))),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor, iconBg;
  final String name, subtitle, price, priceLabel;
  final VoidCallback onTap;

  const _ServiceRow({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.priceLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration:
                  BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D0D2B))),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D0D2B))),
                Text(priceLabel,
                    style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final List<Color> gradient;
  final String tag, title, subtitle;
  final IconData icon;

  const _PromoCard({
    required this.gradient,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(tag,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
                const SizedBox(height: 8),
                Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.2)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.8))),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }
}
