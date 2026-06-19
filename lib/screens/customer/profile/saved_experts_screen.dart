import 'package:flutter/material.dart';
import '../experts/expert_profile_screen.dart';

class SavedExpertsScreen extends StatefulWidget {
  const SavedExpertsScreen({super.key});

  @override
  State<SavedExpertsScreen> createState() => _SavedExpertsScreenState();
}

class _SavedExpertsScreenState extends State<SavedExpertsScreen> {
  final List<_Expert> _experts = [
    _Expert(initials: 'RK', name: 'Rahul Kapoor', title: 'Chartered Accountant',
        rating: '4.9', price: '₹1,499', city: 'Mumbai', isOnline: true,
        colors: [const Color(0xFF4DD0E1), const Color(0xFF4158D0)]),
    _Expert(initials: 'SI', name: 'Sneha Iyer', title: 'Tax Consultant',
        rating: '4.8', price: '₹1,299', city: 'Bengaluru', isOnline: true,
        colors: [const Color(0xFF6366F1), const Color(0xFF4338CA)]),
    _Expert(initials: 'AM', name: 'Adv. Meera Nair', title: 'Property Lawyer',
        rating: '4.9', price: '₹2,200', city: 'Kochi', isOnline: false,
        colors: [const Color(0xFFEC4899), const Color(0xFF9333EA)]),
    _Expert(initials: 'AD', name: 'Arjun Desai', title: 'Full-stack Developer',
        rating: '4.7', price: '₹1,800', city: 'Pune', isOnline: true,
        colors: [const Color(0xFF14B8A6), const Color(0xFF3B82F6)]),
  ];

  void _unsave(int index) {
    setState(() => _experts.removeAt(index));
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Saved experts',
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                        Text('${_experts.length} saved',
                            style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: _experts.isEmpty
                  ? _EmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _experts.length,
                      separatorBuilder: (_, i) => const SizedBox(height: 10),
                      itemBuilder: (ctx, i) {
                        final e = _experts[i];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const ExpertProfileScreen()),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                            ),
                            child: Row(
                              children: [
                                // Avatar
                                Stack(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: e.colors),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(e.initials,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                    if (e.isOnline)
                                      Positioned(
                                        bottom: 1,
                                        right: 1,
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF22C55E),
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(width: 12),
                                // Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(e.name,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF0D0D2B))),
                                          const SizedBox(width: 4),
                                          const Icon(Icons.verified, color: Color(0xFF4158D0), size: 14),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Text(e.title,
                                          style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(Icons.star_rounded,
                                              color: Color(0xFFF59E0B), size: 13),
                                          const SizedBox(width: 3),
                                          Text(e.rating,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF374151))),
                                          const SizedBox(width: 8),
                                          Text('· ${e.price}',
                                              style: const TextStyle(
                                                  fontSize: 12, color: Color(0xFF6B7280))),
                                          const SizedBox(width: 8),
                                          Text('· ${e.city}',
                                              style: const TextStyle(
                                                  fontSize: 12, color: Color(0xFF6B7280))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Unsave button
                                GestureDetector(
                                  onTap: () => _unsave(i),
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEE2E2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.favorite_rounded,
                                        color: Color(0xFFEF4444), size: 18),
                                  ),
                                ),
                              ],
                            ),
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

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFFEE2E2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.favorite_border_rounded,
                color: Color(0xFFEF4444), size: 38),
          ),
          const SizedBox(height: 16),
          const Text('No saved experts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
          const SizedBox(height: 6),
          const Text('Tap ♡ on any expert to save them here.',
              style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
        ],
      ),
    );
  }
}

class _Expert {
  final String initials, name, title, rating, price, city;
  final bool isOnline;
  final List<Color> colors;

  const _Expert({
    required this.initials,
    required this.name,
    required this.title,
    required this.rating,
    required this.price,
    required this.city,
    required this.isOnline,
    required this.colors,
  });
}
