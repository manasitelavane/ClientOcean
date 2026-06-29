import 'package:flutter/material.dart';
import '../experts/expert_profile_screen.dart';
import 'service_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _filterIndex = 0;
  final List<String> _filters = ['All', 'Experts', 'Services', '4.5★ & up'];
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 46,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
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
                          const Icon(Icons.search, color: Color(0xFF9CA3AF), size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchCtrl,
                              autofocus: true,
                              onChanged: (_) => setState(() {}),
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xFF0D0D2B)),
                              decoration: const InputDecoration(
                                hintText: 'Search services or experts...',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Color(0xFF9CA3AF)),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Filter chips
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final active = i == _filterIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _filterIndex = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: active
                            ? const LinearGradient(
                                colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                            : null,
                        color: active ? null : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 6)
                        ],
                      ),
                      child: Row(
                        children: [
                          if (i == 0) ...[
                            Icon(Icons.filter_list_rounded,
                                size: 14,
                                color: active
                                    ? Colors.white
                                    : const Color(0xFF6B7280)),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            _filters[i],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color:
                                  active ? Colors.white : const Color(0xFF374151),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _filterIndex == 1
                    ? '4 experts found'
                    : _filterIndex == 2
                        ? '3 services found'
                        : _filterIndex == 3
                            ? '3 top-rated experts'
                            : '7 results · sorted by relevance',
                style: const TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  // Experts — shown on All (0), Experts (1), 4.5★ (3)
                  if (_filterIndex == 0 || _filterIndex == 1 || _filterIndex == 3) ...[
                    _ExpertResultCard(
                      initials: 'RK',
                      name: 'Rahul Kapoor',
                      subtitle: 'Chartered Accountant · Mumbai',
                      rating: '4.9',
                      colors: const [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ExpertProfileScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ExpertResultCard(
                      initials: 'SI',
                      name: 'Sneha Iyer',
                      subtitle: 'Tax Consultant · Bengaluru',
                      rating: '4.8',
                      colors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ExpertProfileScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ExpertResultCard(
                      initials: 'AM',
                      name: 'Adv. Meera Nair',
                      subtitle: 'Property Lawyer · Kochi',
                      rating: '4.9',
                      colors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ExpertProfileScreen()),
                      ),
                    ),
                    // 4.7 expert — hidden on 4.5★ tab
                    if (_filterIndex != 3) ...[
                      const SizedBox(height: 10),
                      _ExpertResultCard(
                        initials: 'AD',
                        name: 'Arjun Desai',
                        subtitle: 'Full-stack Developer · Pune',
                        rating: '4.7',
                        colors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const ExpertProfileScreen()),
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                  ],
                  // Services — shown on All (0) and Services (2)
                  if (_filterIndex == 0 || _filterIndex == 2) ...[
                    _ServiceResultCard(
                      icon: Icons.trending_up_rounded,
                      iconColor: const Color(0xFF059669),
                      iconBg: const Color(0xFFD1FAE5),
                      name: 'Income Tax Filing',
                      subtitle: '1,240 booked · Finance & Tax',
                      price: '₹1,499',
                      priceLabel: 'starting',
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ServiceDetailScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ServiceResultCard(
                      icon: Icons.trending_up_rounded,
                      iconColor: const Color(0xFF059669),
                      iconBg: const Color(0xFFD1FAE5),
                      name: 'GST Registration',
                      subtitle: '860 booked · Finance & Tax',
                      price: '₹2,999',
                      priceLabel: '',
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ServiceDetailScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ServiceResultCard(
                      icon: Icons.trending_up_rounded,
                      iconColor: const Color(0xFF059669),
                      iconBg: const Color(0xFFD1FAE5),
                      name: 'Company Audit',
                      subtitle: '210 booked · Finance & Tax',
                      price: 'On quote',
                      priceLabel: '',
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ServiceDetailScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpertResultCard extends StatelessWidget {
  final String initials, name, subtitle, rating;
  final List<Color> colors;
  final VoidCallback onTap;

  const _ExpertResultCard({
    required this.initials,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.colors,
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
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(initials,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
              ),
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
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF6B7280))),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star_rounded,
                    color: Color(0xFFF59E0B), size: 14),
                const SizedBox(width: 3),
                Text(rating,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceResultCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor, iconBg;
  final String name, subtitle, price, priceLabel;
  final VoidCallback onTap;

  const _ServiceResultCard({
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
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)
          ],
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
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF6B7280))),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D0D2B))),
                if (priceLabel.isNotEmpty)
                  Text(priceLabel,
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF6B7280))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
