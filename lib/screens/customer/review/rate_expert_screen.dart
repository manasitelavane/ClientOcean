import 'package:flutter/material.dart';
import 'review_success_screen.dart';

class RateExpertScreen extends StatefulWidget {
  const RateExpertScreen({super.key});

  @override
  State<RateExpertScreen> createState() => _RateExpertScreenState();
}

class _RateExpertScreenState extends State<RateExpertScreen> {
  int _stars = 5;
  final List<String> _allTags = ['Professional', 'On time', 'Clear explanation', 'Great value', 'Patient'];
  final Set<int> _selectedTags = {0, 1};
  final TextEditingController _reviewCtrl = TextEditingController();

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
                  const Text('Rate your expert',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFBFDBFE), width: 3),
                        gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                      ),
                      child: const Center(
                        child: Text('RK',
                            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text('Rahul Kapoor',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    const SizedBox(height: 4),
                    const Text('How was your session?',
                        style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
                    const SizedBox(height: 24),

                    // Stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (i) {
                        return GestureDetector(
                          onTap: () => setState(() => _stars = i + 1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              i < _stars ? Icons.star_rounded : Icons.star_border_rounded,
                              color: const Color(0xFFF59E0B),
                              size: 42,
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 28),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text('What went well?',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(_allTags.length, (i) {
                        final active = _selectedTags.contains(i);
                        return GestureDetector(
                          onTap: () => setState(() {
                            if (active) {
                              _selectedTags.remove(i);
                            } else {
                              _selectedTags.add(i);
                            }
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                            decoration: BoxDecoration(
                              gradient: active
                                  ? const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)])
                                  : null,
                              color: active ? null : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: active ? null : Border.all(color: const Color(0xFFE5E7EB)),
                              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
                            ),
                            child: Text(
                              _allTags[i],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: active ? Colors.white : const Color(0xFF374151),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text('Write a review (optional)',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                      ),
                      child: TextField(
                        controller: _reviewCtrl,
                        maxLines: 4,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: 'Share details of your experience...',
                          hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                        ),
                      ),
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
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ReviewSuccessScreen()),
            ),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text('Submit review',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
