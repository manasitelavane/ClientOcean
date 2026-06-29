import 'package:flutter/material.dart';
import '../experts/expert_profile_screen.dart';
import '../booking/book_appointment_screen.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  bool _isSaved = false;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const Text('Service',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                  GestureDetector(
                    onTap: () => setState(() => _isSaved = !_isSaved),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8)],
                      ),
                      child: Icon(
                        _isSaved ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        size: 20,
                        color: _isSaved ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Service icon
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1FAE5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.trending_up_rounded, color: Color(0xFF059669), size: 32),
                    ),
                    const SizedBox(height: 14),
                    const Text('Income Tax Filing',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: const [
                        _TagChip(label: 'Finance & Tax', color: Color(0xFF059669), bg: Color(0xFFD1FAE5)),
                        _TagChip(label: 'Online', color: Color(0xFF374151), bg: Color(0xFFF3F4F6)),
                        _TagChip(label: 'Office visit', color: Color(0xFF374151), bg: Color(0xFFF3F4F6)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'End-to-end ITR filing for salaried & self-employed individuals, including document review and submission.',
                      style: TextStyle(fontSize: 14, color: Color(0xFF4B5563), height: 1.5),
                    ),
                    const SizedBox(height: 20),

                    // Price card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Starting from', style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                              SizedBox(height: 4),
                              Text('₹1,499',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCFCE7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.circle, color: Color(0xFF22C55E), size: 7),
                                SizedBox(width: 5),
                                Text('1,240 booked',
                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF22C55E))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text('Experts offering this',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 12),

                    _ExpertRow(
                      initials: 'RK',
                      name: 'Rahul Kapoor',
                      rating: '4.9',
                      price: '₹1,499',
                      colors: const [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ExpertProfileScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _ExpertRow(
                      initials: 'SI',
                      name: 'Sneha Iyer',
                      rating: '4.8',
                      price: '₹1,299',
                      colors: const [Color(0xFF6366F1), Color(0xFF4338CA)],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ExpertProfileScreen()),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const BookAppointmentScreen()),
            ),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('Book now  →',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  final Color color, bg;
  const _TagChip({required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
    );
  }
}

class _ExpertRow extends StatelessWidget {
  final String initials, name, rating, price;
  final List<Color> colors;
  final VoidCallback onTap;

  const _ExpertRow({
    required this.initials,
    required this.name,
    required this.rating,
    required this.price,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(initials,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF0D0D2B))),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 13),
                      const SizedBox(width: 3),
                      Text(rating,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                      const Text(' · ', style: TextStyle(color: Color(0xFF6B7280))),
                      Text(price,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFD1D5DB)),
          ],
        ),
      ),
    );
  }
}
