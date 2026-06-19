import 'package:flutter/material.dart';

class SearchFiltersScreen extends StatefulWidget {
  const SearchFiltersScreen({super.key});

  @override
  State<SearchFiltersScreen> createState() => _SearchFiltersScreenState();
}

class _SearchFiltersScreenState extends State<SearchFiltersScreen> {
  String _sortBy = 'Relevance';
  String _category = 'All';
  final List<String> _deliveryModes = [];
  String _rating = 'Any';
  RangeValues _priceRange = const RangeValues(0, 10000);

  final _sortOptions = ['Relevance', 'Rating', 'Price: Low to High', 'Price: High to Low', 'Most booked'];
  final _categories = ['All', 'Finance & Tax', 'Legal', 'Health', 'Tech & IT', 'Design', 'Business'];
  final _modes = ['Online', 'Office visit', 'Home visit'];
  final _ratings = ['Any', '3★ & up', '4★ & up', '4.5★ & up'];

  void _toggleMode(String mode) {
    setState(() {
      if (_deliveryModes.contains(mode)) {
        _deliveryModes.remove(mode);
      } else {
        _deliveryModes.add(mode);
      }
    });
  }

  void _reset() {
    setState(() {
      _sortBy = 'Relevance';
      _category = 'All';
      _deliveryModes.clear();
      _rating = 'Any';
      _priceRange = const RangeValues(0, 10000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
                  const Expanded(
                    child: Text('Filters',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B))),
                  ),
                  GestureDetector(
                    onTap: _reset,
                    child: const Text('Reset all',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
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
                    // Sort by
                    _SectionTitle(title: 'Sort by'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _sortOptions.map((s) => _ChoiceChip(
                        label: s,
                        selected: _sortBy == s,
                        onTap: () => setState(() => _sortBy = s),
                      )).toList(),
                    ),

                    const SizedBox(height: 24),

                    // Category
                    _SectionTitle(title: 'Category'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _categories.map((c) => _ChoiceChip(
                        label: c,
                        selected: _category == c,
                        onTap: () => setState(() => _category = c),
                      )).toList(),
                    ),

                    const SizedBox(height: 24),

                    // Delivery mode
                    _SectionTitle(title: 'Delivery mode'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _modes.map((m) => _ChoiceChip(
                        label: m,
                        selected: _deliveryModes.contains(m),
                        onTap: () => _toggleMode(m),
                      )).toList(),
                    ),

                    const SizedBox(height: 24),

                    // Rating
                    _SectionTitle(title: 'Minimum rating'),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _ratings.map((r) => _ChoiceChip(
                        label: r,
                        selected: _rating == r,
                        onTap: () => setState(() => _rating = r),
                      )).toList(),
                    ),

                    const SizedBox(height: 24),

                    // Price range
                    _SectionTitle(title: 'Price range'),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('₹${_priceRange.start.round()}',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
                        Text('₹${_priceRange.end.round()}',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF4158D0))),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: const Color(0xFF4158D0),
                        inactiveTrackColor: const Color(0xFFE0E7FF),
                        thumbColor: const Color(0xFF4158D0),
                        overlayColor: const Color(0xFF4158D0).withValues(alpha: 0.12),
                        rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
                        trackHeight: 4,
                      ),
                      child: RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 10000,
                        divisions: 100,
                        onChanged: (v) => setState(() => _priceRange = v),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            // Apply button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF4DD0E1), Color(0xFF4158D0)]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text('Apply filters',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0D0D2B)));
  }
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ChoiceChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4158D0) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF4158D0) : const Color(0xFFE5E7EB),
          ),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6)],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : const Color(0xFF374151),
          ),
        ),
      ),
    );
  }
}
