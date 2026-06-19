import 'package:flutter/material.dart';
import '../booking/book_appointment_screen.dart';

class ExpertProfileScreen extends StatefulWidget {
  const ExpertProfileScreen({super.key});

  @override
  State<ExpertProfileScreen> createState() => _ExpertProfileScreenState();
}

class _ExpertProfileScreenState extends State<ExpertProfileScreen> {
  int _tabIndex = 0;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: Column(
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
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                child: Column(
                  children: [
                    Row(
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
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        // Avatar with border ring
                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)],
                            ),
                          ),
                          child: const Center(
                            child: Text('RK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text('Rahul Kapoor',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF0D0D2B))),
                                  SizedBox(width: 6),
                                  Icon(Icons.verified, color: Color(0xFF4158D0), size: 18),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text('Chartered Accountant',
                                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _StatusChip(
                                    label: 'Available',
                                    color: const Color(0xFF22C55E),
                                    bg: const Color(0xFFDCFCE7),
                                    icon: Icons.circle,
                                  ),
                                  const SizedBox(width: 8),
                                  _StatusChip(
                                    label: 'Mumbai',
                                    color: const Color(0xFF4158D0),
                                    bg: const Color(0xFFE0E7FF),
                                    icon: Icons.location_on_outlined,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Stat cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Expanded(child: _StatCard(icon: Icons.star_outline_rounded, value: '4.9', label: 'Rating')),
                SizedBox(width: 10),
                Expanded(child: _StatCard(icon: Icons.workspace_premium_outlined, value: '11 yrs', label: 'Experience')),
                SizedBox(width: 10),
                Expanded(child: _StatCard(icon: Icons.chat_bubble_outline_rounded, value: '312', label: 'Reviews')),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: List.generate(3, (i) {
                  final labels = ['About', 'Services', 'Reviews'];
                  final active = i == _tabIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _tabIndex = i),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: active ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: active
                              ? [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6)]
                              : null,
                        ),
                        child: Text(
                          labels[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                            color: active ? const Color(0xFF0D0D2B) : const Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Tab content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _tabIndex == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CA with 11 years of practice helping individuals and SMEs with tax planning, filings and audits. Quick turnaround, transparent pricing.',
                          style: TextStyle(fontSize: 14, color: Color(0xFF4B5563), height: 1.6),
                        ),
                        const SizedBox(height: 20),
                        const Text('Languages',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          children: const [
                            _LangChip(label: 'English'),
                            _LangChip(label: 'Hindi'),
                            _LangChip(label: 'Marathi'),
                          ],
                        ),
                        const SizedBox(height: 80),
                      ],
                    )
                  : const SizedBox(height: 80),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Consultation from',
                      style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                  Text('₹1,499',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const BookAppointmentScreen()),
                  ),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text('Book now  →',
                          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color, bg;
  final IconData icon;
  const _StatusChip({required this.label, required this.color, required this.bg, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 8, color: color),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value, label;
  const _StatCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF4158D0), size: 20),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
          Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
        ],
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  final String label;
  const _LangChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF374151))),
    );
  }
}
