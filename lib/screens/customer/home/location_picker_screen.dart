import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final _searchCtrl = TextEditingController();
  final String _selected = 'Andheri West, Mumbai';

  final List<Map<String, String>> _popular = [
    {'city': 'Mumbai', 'area': 'Andheri West'},
    {'city': 'Bengaluru', 'area': 'Koramangala'},
    {'city': 'Delhi', 'area': 'Connaught Place'},
    {'city': 'Pune', 'area': 'Baner'},
    {'city': 'Hyderabad', 'area': 'Gachibowli'},
    {'city': 'Chennai', 'area': 'Anna Nagar'},
    {'city': 'Kochi', 'area': 'Ernakulam'},
    {'city': 'Ahmedabad', 'area': 'Navrangpura'},
  ];

  List<Map<String, String>> get _filtered {
    final q = _searchCtrl.text.toLowerCase();
    if (q.isEmpty) return _popular;
    return _popular
        .where((e) =>
            e['city']!.toLowerCase().contains(q) ||
            e['area']!.toLowerCase().contains(q))
        .toList();
  }

  void _pick(String label) {
    Navigator.pop(context, label);
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
                  const SizedBox(width: 14),
                  const Text('Choose location',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0D0D2B))),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Search input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8)
                  ],
                ),
                child: TextField(
                  controller: _searchCtrl,
                  onChanged: (_) => setState(() {}),
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFF0D0D2B)),
                  decoration: const InputDecoration(
                    hintText: 'Search city or area...',
                    hintStyle:
                        TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                    prefixIcon:
                        Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Use current location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () => _pick('Current Location'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.my_location_rounded,
                          color: Color(0xFF4158D0), size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Use current location',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4158D0))),
                            Text('Using GPS',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF6B7280))),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Color(0xFF4158D0)),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Popular cities
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    _searchCtrl.text.isEmpty
                        ? 'Popular cities'
                        : 'Search results',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9CA3AF),
                        letterSpacing: 0.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _filtered.isEmpty
                  ? const Center(
                      child: Text('No results found',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF9CA3AF))),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, i) => const SizedBox(height: 8),
                      itemBuilder: (ctx, i) {
                        final e = _filtered[i];
                        final label = '${e['area']}, ${e['city']}';
                        final isActive = _selected == label;
                        return GestureDetector(
                          onTap: () => _pick(label),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFFE0E7FF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: isActive
                                  ? Border.all(
                                      color: const Color(0xFF4158D0),
                                      width: 1.5)
                                  : null,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.black.withValues(alpha: 0.04),
                                    blurRadius: 8)
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: isActive
                                        ? const Color(0xFF4158D0)
                                        : const Color(0xFFEEF0FA),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(Icons.location_on_outlined,
                                      size: 18,
                                      color: isActive
                                          ? Colors.white
                                          : const Color(0xFF4158D0)),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(e['area']!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: isActive
                                                  ? const Color(0xFF4158D0)
                                                  : const Color(0xFF0D0D2B))),
                                      Text(e['city']!,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF6B7280))),
                                    ],
                                  ),
                                ),
                                if (isActive)
                                  const Icon(Icons.check_circle_rounded,
                                      color: Color(0xFF4158D0), size: 18),
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
