import 'package:flutter/material.dart';
import 'service_detail_screen.dart';

// ── Data model ─────────────────────────────────────────────────────────────

class _SvcItem {
  final String name, subtitle, price, priceLabel;
  const _SvcItem({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.priceLabel,
  });
}

class _CatConfig {
  final String title, countLabel;
  final IconData icon;
  final Color iconColor, iconBg;
  final List<_SvcItem> all, popular, online, inPerson, topRated;

  const _CatConfig({
    required this.title,
    required this.countLabel,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.all,
    required this.popular,
    required this.online,
    required this.inPerson,
    required this.topRated,
  });
}

const _configs = <String, _CatConfig>{
  'Finance & Tax': _CatConfig(
    title: 'Finance & Tax',
    countLabel: '48 services available',
    icon: Icons.trending_up_rounded,
    iconColor: Color(0xFF059669),
    iconBg: Color(0xFFD1FAE5),
    all: [
      _SvcItem(name: 'Income Tax Filing', subtitle: '1,240 booked · Finance & Tax', price: '₹1,499', priceLabel: 'starting'),
      _SvcItem(name: 'GST Registration', subtitle: '860 booked · Finance & Tax', price: '₹2,999', priceLabel: ''),
      _SvcItem(name: 'Company Audit', subtitle: '210 booked · Finance & Tax', price: 'On quote', priceLabel: ''),
      _SvcItem(name: 'Tax Consultation', subtitle: '540 booked · Finance & Tax', price: '₹749', priceLabel: 'per hour'),
    ],
    popular: [
      _SvcItem(name: 'Income Tax Filing', subtitle: '1,240 booked · Most popular', price: '₹1,499', priceLabel: 'starting'),
      _SvcItem(name: 'GST Registration', subtitle: '860 booked · Most popular', price: '₹2,999', priceLabel: ''),
    ],
    online: [
      _SvcItem(name: 'Income Tax Filing', subtitle: '1,240 booked · Online only', price: '₹1,499', priceLabel: 'starting'),
      _SvcItem(name: 'Tax Consultation', subtitle: '540 booked · Online only', price: '₹749', priceLabel: 'per hour'),
    ],
    inPerson: [
      _SvcItem(name: 'GST Registration', subtitle: '860 booked · Office visit', price: '₹2,999', priceLabel: ''),
      _SvcItem(name: 'Company Audit', subtitle: '210 booked · Office visit', price: 'On quote', priceLabel: ''),
    ],
    topRated: [
      _SvcItem(name: 'Income Tax Filing', subtitle: '4.9★ · 1,240 booked', price: '₹1,499', priceLabel: 'starting'),
      _SvcItem(name: 'GST Registration', subtitle: '4.8★ · 860 booked', price: '₹2,999', priceLabel: ''),
    ],
  ),

  'Legal': _CatConfig(
    title: 'Legal',
    countLabel: '32 services available',
    icon: Icons.gavel_rounded,
    iconColor: Color(0xFF4158D0),
    iconBg: Color(0xFFE0E7FF),
    all: [
      _SvcItem(name: 'Rent Agreement', subtitle: '920 booked · Legal', price: '₹999', priceLabel: ''),
      _SvcItem(name: 'Property Dispute', subtitle: '340 booked · Legal', price: '₹2,499', priceLabel: 'starting'),
      _SvcItem(name: 'Will & Testament', subtitle: '180 booked · Legal', price: '₹3,499', priceLabel: ''),
      _SvcItem(name: 'Company Incorporation', subtitle: '410 booked · Legal', price: '₹5,999', priceLabel: ''),
    ],
    popular: [
      _SvcItem(name: 'Rent Agreement', subtitle: '920 booked · Most popular', price: '₹999', priceLabel: ''),
      _SvcItem(name: 'Company Incorporation', subtitle: '410 booked · Most popular', price: '₹5,999', priceLabel: ''),
    ],
    online: [
      _SvcItem(name: 'Rent Agreement', subtitle: '920 booked · Online only', price: '₹999', priceLabel: ''),
      _SvcItem(name: 'Will & Testament', subtitle: '180 booked · Online only', price: '₹3,499', priceLabel: ''),
    ],
    inPerson: [
      _SvcItem(name: 'Property Dispute', subtitle: '340 booked · Office visit', price: '₹2,499', priceLabel: 'starting'),
      _SvcItem(name: 'Company Incorporation', subtitle: '410 booked · Office visit', price: '₹5,999', priceLabel: ''),
    ],
    topRated: [
      _SvcItem(name: 'Rent Agreement', subtitle: '4.9★ · 920 booked', price: '₹999', priceLabel: ''),
      _SvcItem(name: 'Will & Testament', subtitle: '4.8★ · 180 booked', price: '₹3,499', priceLabel: ''),
    ],
  ),

  'Health': _CatConfig(
    title: 'Health',
    countLabel: '25 services available',
    icon: Icons.favorite_border_rounded,
    iconColor: Color(0xFFEF4444),
    iconBg: Color(0xFFFEE2E2),
    all: [
      _SvcItem(name: 'Doctor Consultation', subtitle: '2,100 booked · Health', price: '₹499', priceLabel: 'per session'),
      _SvcItem(name: 'Nutrition Plan', subtitle: '680 booked · Health', price: '₹1,199', priceLabel: ''),
      _SvcItem(name: 'Mental Wellness Session', subtitle: '430 booked · Health', price: '₹899', priceLabel: 'per hour'),
      _SvcItem(name: 'Health Check Report', subtitle: '310 booked · Health', price: '₹1,499', priceLabel: ''),
    ],
    popular: [
      _SvcItem(name: 'Doctor Consultation', subtitle: '2,100 booked · Most popular', price: '₹499', priceLabel: 'per session'),
      _SvcItem(name: 'Nutrition Plan', subtitle: '680 booked · Most popular', price: '₹1,199', priceLabel: ''),
    ],
    online: [
      _SvcItem(name: 'Doctor Consultation', subtitle: '2,100 booked · Online only', price: '₹499', priceLabel: 'per session'),
      _SvcItem(name: 'Mental Wellness Session', subtitle: '430 booked · Online only', price: '₹899', priceLabel: 'per hour'),
    ],
    inPerson: [
      _SvcItem(name: 'Doctor Consultation', subtitle: '2,100 booked · Clinic visit', price: '₹499', priceLabel: 'per session'),
      _SvcItem(name: 'Health Check Report', subtitle: '310 booked · Lab visit', price: '₹1,499', priceLabel: ''),
    ],
    topRated: [
      _SvcItem(name: 'Doctor Consultation', subtitle: '4.9★ · 2,100 booked', price: '₹499', priceLabel: 'per session'),
      _SvcItem(name: 'Mental Wellness Session', subtitle: '4.8★ · 430 booked', price: '₹899', priceLabel: 'per hour'),
    ],
  ),

  'Tech & IT': _CatConfig(
    title: 'Tech & IT',
    countLabel: '38 services available',
    icon: Icons.bolt_rounded,
    iconColor: Color(0xFF7C3AED),
    iconBg: Color(0xFFEDE9FE),
    all: [
      _SvcItem(name: 'Website Development', subtitle: '760 booked · Tech & IT', price: '₹8,999', priceLabel: 'starting'),
      _SvcItem(name: 'App Development', subtitle: '420 booked · Tech & IT', price: '₹14,999', priceLabel: 'starting'),
      _SvcItem(name: 'IT Support & Setup', subtitle: '580 booked · Tech & IT', price: '₹599', priceLabel: 'per hour'),
      _SvcItem(name: 'Cybersecurity Audit', subtitle: '190 booked · Tech & IT', price: 'On quote', priceLabel: ''),
    ],
    popular: [
      _SvcItem(name: 'Website Development', subtitle: '760 booked · Most popular', price: '₹8,999', priceLabel: 'starting'),
      _SvcItem(name: 'App Development', subtitle: '420 booked · Most popular', price: '₹14,999', priceLabel: 'starting'),
    ],
    online: [
      _SvcItem(name: 'Website Development', subtitle: '760 booked · Online only', price: '₹8,999', priceLabel: 'starting'),
      _SvcItem(name: 'IT Support & Setup', subtitle: '580 booked · Remote support', price: '₹599', priceLabel: 'per hour'),
    ],
    inPerson: [
      _SvcItem(name: 'App Development', subtitle: '420 booked · On-site', price: '₹14,999', priceLabel: 'starting'),
      _SvcItem(name: 'Cybersecurity Audit', subtitle: '190 booked · On-site', price: 'On quote', priceLabel: ''),
    ],
    topRated: [
      _SvcItem(name: 'Website Development', subtitle: '4.9★ · 760 booked', price: '₹8,999', priceLabel: 'starting'),
      _SvcItem(name: 'App Development', subtitle: '4.8★ · 420 booked', price: '₹14,999', priceLabel: 'starting'),
    ],
  ),

  'Design': _CatConfig(
    title: 'Design',
    countLabel: '29 services available',
    icon: Icons.palette_outlined,
    iconColor: Color(0xFF16A34A),
    iconBg: Color(0xFFDCFCE7),
    all: [
      _SvcItem(name: 'Logo Design', subtitle: '1,050 booked · Design', price: '₹1,999', priceLabel: 'starting'),
      _SvcItem(name: 'UI/UX Design', subtitle: '390 booked · Design', price: '₹4,999', priceLabel: 'starting'),
      _SvcItem(name: 'Brand Identity Kit', subtitle: '270 booked · Design', price: '₹5,499', priceLabel: ''),
      _SvcItem(name: 'Social Media Kit', subtitle: '610 booked · Design', price: '₹2,499', priceLabel: ''),
    ],
    popular: [
      _SvcItem(name: 'Logo Design', subtitle: '1,050 booked · Most popular', price: '₹1,999', priceLabel: 'starting'),
      _SvcItem(name: 'UI/UX Design', subtitle: '390 booked · Most popular', price: '₹4,999', priceLabel: 'starting'),
    ],
    online: [
      _SvcItem(name: 'Logo Design', subtitle: '1,050 booked · Online delivery', price: '₹1,999', priceLabel: 'starting'),
      _SvcItem(name: 'Social Media Kit', subtitle: '610 booked · Online delivery', price: '₹2,499', priceLabel: ''),
    ],
    inPerson: [
      _SvcItem(name: 'UI/UX Design', subtitle: '390 booked · Workshop', price: '₹4,999', priceLabel: 'starting'),
      _SvcItem(name: 'Brand Identity Kit', subtitle: '270 booked · Workshop', price: '₹5,499', priceLabel: ''),
    ],
    topRated: [
      _SvcItem(name: 'Logo Design', subtitle: '4.9★ · 1,050 booked', price: '₹1,999', priceLabel: 'starting'),
      _SvcItem(name: 'UI/UX Design', subtitle: '4.8★ · 390 booked', price: '₹4,999', priceLabel: 'starting'),
    ],
  ),

  'Business': _CatConfig(
    title: 'Business',
    countLabel: '21 services available',
    icon: Icons.business_center_outlined,
    iconColor: Color(0xFFD97706),
    iconBg: Color(0xFFFEF3C7),
    all: [
      _SvcItem(name: 'Business Plan Writing', subtitle: '320 booked · Business', price: '₹3,999', priceLabel: ''),
      _SvcItem(name: 'Market Research Report', subtitle: '210 booked · Business', price: '₹4,999', priceLabel: ''),
      _SvcItem(name: 'CA Business Advisory', subtitle: '480 booked · Business', price: '₹1,999', priceLabel: 'per hour'),
      _SvcItem(name: 'Startup Registration', subtitle: '560 booked · Business', price: '₹6,999', priceLabel: ''),
    ],
    popular: [
      _SvcItem(name: 'Business Plan Writing', subtitle: '320 booked · Most popular', price: '₹3,999', priceLabel: ''),
      _SvcItem(name: 'CA Business Advisory', subtitle: '480 booked · Most popular', price: '₹1,999', priceLabel: 'per hour'),
    ],
    online: [
      _SvcItem(name: 'Business Plan Writing', subtitle: '320 booked · Online only', price: '₹3,999', priceLabel: ''),
      _SvcItem(name: 'Market Research Report', subtitle: '210 booked · Online only', price: '₹4,999', priceLabel: ''),
    ],
    inPerson: [
      _SvcItem(name: 'CA Business Advisory', subtitle: '480 booked · Office visit', price: '₹1,999', priceLabel: 'per hour'),
      _SvcItem(name: 'Startup Registration', subtitle: '560 booked · Office visit', price: '₹6,999', priceLabel: ''),
    ],
    topRated: [
      _SvcItem(name: 'Business Plan Writing', subtitle: '4.9★ · 320 booked', price: '₹3,999', priceLabel: ''),
      _SvcItem(name: 'CA Business Advisory', subtitle: '4.8★ · 480 booked', price: '₹1,999', priceLabel: 'per hour'),
    ],
  ),
};

// ── Screen ──────────────────────────────────────────────────────────────────

class CategoryScreen extends StatefulWidget {
  final String category;
  const CategoryScreen({super.key, this.category = 'Finance & Tax'});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _filterIndex = 0;
  final List<String> _filters = ['All', 'Popular', 'Online', 'In-person', 'Top rated'];

  List<_SvcItem> get _items {
    final cfg = _configs[widget.category] ?? _configs['Finance & Tax']!;
    switch (_filterIndex) {
      case 1: return cfg.popular;
      case 2: return cfg.online;
      case 3: return cfg.inPerson;
      case 4: return cfg.topRated;
      default: return cfg.all;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cfg = _configs[widget.category] ?? _configs['Finance & Tax']!;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: cfg.iconBg,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(cfg.icon, color: cfg.iconColor, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cfg.title,
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                          Text(cfg.countLabel,
                              style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

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
                            ? const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                            : null,
                        color: active ? null : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)],
                      ),
                      child: Text(
                        _filters[i],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: active ? Colors.white : const Color(0xFF374151),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                itemCount: _items.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  final svc = _items[i];
                  return _ServiceCard(
                    icon: cfg.icon,
                    iconColor: cfg.iconColor,
                    iconBg: cfg.iconBg,
                    name: svc.name,
                    subtitle: svc.subtitle,
                    price: svc.price,
                    priceLabel: svc.priceLabel,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ServiceDetailScreen()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor, iconBg;
  final String name, subtitle, price, priceLabel;
  final VoidCallback onTap;

  const _ServiceCard({
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
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                if (priceLabel.isNotEmpty)
                  Text(priceLabel, style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
